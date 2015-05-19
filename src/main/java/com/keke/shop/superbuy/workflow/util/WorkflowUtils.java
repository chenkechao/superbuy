package com.keke.shop.superbuy.workflow.util;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.ProcessDefinition;
import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;

public class WorkflowUtils {
	

	private static Logger logger = LoggerFactory.getLogger(WorkflowUtils.class);
	
	public static String exportDiagramToFile(RepositoryService repositoryService,ProcessDefinition processDefinition
			,String exportDir) throws IOException{
		String diagramResourceName = processDefinition.getDiagramResourceName();
		String key = processDefinition.getKey();
		int version = processDefinition.getVersion();
		String diagramPath = "";
		
		InputStream resourceAsStream = repositoryService.getResourceAsStream(processDefinition.getDeploymentId(), diagramResourceName);
		byte[] b = new byte[resourceAsStream.available()];
		
		int len = -1;
		resourceAsStream.read(b, 0, b.length);
		
		String diagramDir = exportDir + "/" + key + "/" + version;
		File diagramDirFile = new File(diagramDir);
		if(!diagramDirFile.exists()){
			diagramDirFile.mkdirs();
		}
		diagramPath = diagramDir + "/" + diagramResourceName;
		File file = new File(diagramPath);
		
		if(file.exists()){
			logger.debug("diagram exist,ignore ... : {}", diagramPath);
			return diagramPath;
		}else{
			file.createNewFile();
		}
		
		logger.debug("export diagram to : {}", diagramPath);
		FileUtils.writeByteArrayToFile(file, b, true);
		return diagramPath;
	}
}
