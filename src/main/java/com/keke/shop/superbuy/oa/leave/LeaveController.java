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
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.activiti.engine.task.TaskQuery;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.keke.shop.superbuy.oa.leave.entity.Leave;
import com.keke.shop.superbuy.oa.leave.service.LeaveManager;
import com.keke.shop.superbuy.security.entity.User;
import com.keke.shop.superbuy.security.shiro.ShiroUtils;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.keke.framework.util.Variable;

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
		User user = ShiroUtils.getUser();
		//User user = (User) session.getAttribute("user");
		if(user==null || "".equals(user.getId())) {
			return "/";
		}
		leave.setUserId(user.getUsername());
		Map<String,Object> variables = new HashMap<String,Object>();
		
		leaveManager.saveLeave(leave);
		String businessKey = leave.getId().toString();
		ProcessInstance processInstance = null;
		
		try{
			identityService.setAuthenticatedUserId(user.getUsername());
			processInstance = runtimeService.startProcessInstanceByKey("leave", businessKey, variables);
			String processInstanceId = processInstance.getId();
			leave.setProcessInstanceId(processInstanceId);
			logger.debug("start process of {key={}, bkey={}, pid={}, variables={}}", new Object[]{"leave", businessKey, processInstanceId, variables});
		}catch(Exception e){
			System.out.println(e.toString());
		}
		finally{
			identityService.setAuthenticatedUserId(null);
		}
		
		return "redirect:/oa/leave/task/list";
	}
	
	@RequestMapping(value = "task/list")
	public String taskList(){
		return "oa/leave/task/list";
	}
	
	@RequestMapping(value = "task/list/json", produces="application/json")
	@ResponseBody
	public List<Map<String,Object>> taskListJson() {
		User user = ShiroUtils.getUser();
		List<Leave> results = new ArrayList<Leave>();
		TaskQuery taskQuery = taskService.createTaskQuery().taskCandidateOrAssigned(String.valueOf(user.getUsername()));
		List<Task> tasks = taskQuery.list();
		
		ProcessDefinition processDefinition = null;
		List<Map<String,Object>> mapList = new ArrayList<>();
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
//			leave.setTask(task);
//			leave.setProcessInstance(processInstance);
//			leave.setProcessDefinition(processDefinition);
//			results.add(leave);
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("id", leave.getId());
			map.put("leaveType", leave.getLeaveType());
			map.put("userId", leave.getUserId());
			map.put("applyTime", leave.getApplyTime());
			map.put("startTime", leave.getStartTime());
			map.put("endTime", leave.getEndTime());
			map.put("createTime", task.getCreateTime());
			map.put("suspended", processInstance.isSuspended());
			map.put("processDefinitionId", processDefinition.getId());
			map.put("assignee", task.getAssignee());
			map.put("taskId", task.getId());
			map.put("taskDefinitionKey", task.getTaskDefinitionKey());
			map.put("taskName", task.getName());
			mapList.add(map);
		}
		return mapList;
	}
	
	@RequestMapping(value="task/claim/{id}")
	@ResponseBody
	public String claim(@PathVariable("id") String taskId) {
		User user = ShiroUtils.getUser();
		try {
			taskService.claim(taskId, user.getUsername());
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	@RequestMapping(value="detail/{id}/{taskId}",produces = "application/json")
	@ResponseBody
	public Leave getLeave(@PathVariable("id") Long id,@PathVariable("taskId") String taskId){
		Leave leave = leaveManager.getLeave(id);
		Map<String,Object> variables = taskService.getVariables(taskId);
		leave.setVariables(variables);
		return leave;
	}
	
	@RequestMapping(value="detail/showDetailForm")
	public String showDetailForm(ModelAndView mav) {
		return "oa/leave/showDetailForm";
	}
	
	@RequestMapping(value="detail/showModifyApply")
	public String showModifyApply(ModelAndView mav) {
		return "oa/leave/modifyApply";
	}
	
	@RequestMapping(value="detail/showReportBack")
	public String showReportBack(ModelAndView mav) {
		return "oa/leave/showReportBack";
	}
	
	@RequestMapping(value="complete/{taskId}", method={RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public String complete(@PathVariable("taskId") String taskId,Variable var) {
		try {
			Map<String,Object> variables = var.getVariableMap();
			logger.debug(variables.toString());
			taskService.complete(taskId, variables);
			return "success";
		} catch (Exception e) {
			logger.error("error on complete task {}, variables={}", new Object[]{taskId, var.getVariableMap(), e});
			return "error";
		}
	}
}
