package com.keke.shop.superbuy.config;


import org.apache.ibatis.jdbc.ScriptRunner;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Component;

import com.keke.shop.superbuy.orm.JdbcUtils;
import com.keke.shop.superbuy.util.StreamUtils;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * 脚本执行类
 * @author yuqs
 * @since 1.0
 */
@Component(value="executor")
public class ScriptsExecutor {
    private static final Logger log = LoggerFactory.getLogger(ScriptsExecutor.class);
    //数据源
    @Autowired
    private DataSource dataSource;

    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    @PostConstruct
    public void run() {
        log.info("scripts running......");
        Connection conn = null;
        try {
            conn = dataSource.getConnection();
            if(JdbcUtils.isExec(conn)) {
                log.info("script has completed execution.skip this step");
                return;
            }
            String databaseType = JdbcUtils.getDatabaseType(conn);
            String[] schemas = new String[]{"db/schema-" + databaseType + ".sql", "db/init-data.sql"};
            ScriptRunner runner = new ScriptRunner(conn);
            for(String schema : schemas) {
                //runner.runScript(schema);
            	InputStream input = StreamUtils.getStreamFromClasspath(schema);
                Reader reader = new InputStreamReader(input, "UTF-8");
                runner.runScript(reader);
            }
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
}
