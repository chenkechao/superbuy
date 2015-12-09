package com.keke.framework.config;

import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.Deployment;
import org.apache.ibatis.jdbc.ScriptRunner;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.keke.framework.orm.JdbcUtils;
import com.keke.framework.util.StreamUtils;
import javax.annotation.PostConstruct;
import javax.sql.DataSource;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

/**
 * 脚本执行类,在spring构造该对象前初始化数据库
 * @author kechaocx
 * @since 1.0
 */
@Component(value="executor")
public class ScriptsExecutor {
    private static final Logger log = LoggerFactory.getLogger(ScriptsExecutor.class);
    @Autowired
    private DataSource dataSource;//数据源
    @Autowired
    private RepositoryService repositoryServie;
    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    @PostConstruct
    public void run() {
        log.info("scripts running......");
        Connection conn = null;
        try {
            conn = dataSource.getConnection();
            //@TODO 如何判断数据库已经初始化过
            if(JdbcUtils.isExec(conn)) {
                log.info("script has completed execution.skip this step");
                return;
            }
            String databaseType = JdbcUtils.getDatabaseType(conn);
            String[] schemas = new String[]{"db/schema-" + databaseType + ".sql", "db/init-data.sql"};
            ScriptRunner runner = new ScriptRunner(conn);
            for(String schema : schemas) {
            	InputStream input = StreamUtils.getStreamFromClasspath(schema);
                Reader reader = new InputStreamReader(input, "UTF-8");
                runner.runScript(reader);
            }
            //TODO 需要加一个配置文件来判断是否要初始化process
            initProcessDefinitions();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                JdbcUtils.close(conn);
            } catch (SQLException e) {
                //ignore
            }
        }
    }
    
    private void initProcessDefinitions(){
    	String deployName = "Demo processes";
    	List<Deployment> deploymentList = repositoryServie.createDeploymentQuery()
    			.deploymentName(deployName).list();
    	if(deploymentList == null || deploymentList.isEmpty()){
    		repositoryServie.createDeployment()
    		.name(deployName).addClasspathResource("org/activiti/explorer/demo/process/leave.bpmn20.xml")
    		.name("org/activiti/explorer/demo/process/leave.png")
    		.deploy();
    	}
    }
}
