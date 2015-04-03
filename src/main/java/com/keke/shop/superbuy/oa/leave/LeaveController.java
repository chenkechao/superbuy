package com.keke.shop.superbuy.oa.leave;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.activiti.engine.IdentityService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.identity.User;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.activiti.engine.task.TaskQuery;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.keke.shop.superbuy.oa.leave.entity.Leave;
import com.keke.shop.superbuy.service.oa.leave.LeaveManager;

@Controller
@RequestMapping(value = "/oa/leave")
public class LeaveController {
	
	private static Logger logger = LoggerFactory.getLogger(LeaveController.class);
	@Autowired
	private IdentityService identityService;
	
	@Autowired
	private RuntimeService runtimeService;
	
	@Autowired
	private TaskService taskService;
	
	@Autowired
	private RepositoryService repositoryService;
	
	@Autowired
	private LeaveManager leaveManager;

	@RequestMapping(value = {"apply" , ""})
	public String createForm(Model model) {
		model.addAttribute("leave", new Leave());
		return "oa/leave/leaveApply";
	}
	
	@RequestMapping(value="start",method=RequestMethod.POST)
	public String startWorkflow(@Valid @ModelAttribute Leave leave,RedirectAttributes redirectAttributes,HttpSession session) {
		User user = (User) session.getAttribute("user");
		if(user==null || "".equals(user.getId())) {
			return "/";
		}
		leave.setUserId(user.getId());
		Map<String,Object> variables = new HashMap<String,Object>();
		
		leaveManager.saveLeave(leave);
		String businessKey = leave.getId().toString();
		ProcessInstance processInstance = null;
		
		try{
			identityService.setAuthenticatedUserId(leave.getUserId());
			processInstance = runtimeService.startProcessInstanceByKey("fixSystemFailure", businessKey, variables);
			String processInstanceId = processInstance.getId();
			leave.setProcessInstanceId(processInstanceId);
			logger.debug("start process of {key={}, bkey={}, pid={}, variables={}}", new Object[]{"leave", businessKey, processInstanceId, variables});
		}catch(Exception e){
			System.out.println(e.toString());
		}
		finally{
			identityService.setAuthenticatedUserId(null);
		}
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "list/task")
	public ModelAndView taskList(HttpSession session, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("/oa/leave/taskList");
		User user = (User) session.getAttribute("user");
		
		List<Leave> results = new ArrayList<Leave>();
		TaskQuery taskQuery = taskService.createTaskQuery().taskCandidateOrAssigned(user.getId());
		List<Task> tasks = taskQuery.list();
		
		ProcessDefinition processDefinition = null;
		
		for(Task task:tasks){
			String processInstanceId = task.getProcessInstanceId();
			ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(processInstanceId).singleResult();
			String businessKey = processInstance.getBusinessKey();
			if(businessKey == null) {
				continue;
			}
			
			if(processDefinition == null) {
				processDefinition =repositoryService.createProcessDefinitionQuery()
				.processDefinitionId(processInstance.getProcessDefinitionId()).singleResult();
			}
			
			Leave leave = leaveManager.getLeave(new Long(businessKey));
			leave.setTask(task);
			leave.setProcessInstance(processInstance);
			leave.setProcessDefinition(processDefinition);
			results.add(leave);
			
		}
		mav.addObject("results", results);
		return mav;
	}
}