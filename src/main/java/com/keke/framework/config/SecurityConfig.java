package com.keke.framework.config;

import org.springframework.context.annotation.*;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.servlet.configuration.EnableWebMvcSecurity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.crypto.password.StandardPasswordEncoder;
import org.springframework.security.web.authentication.rememberme.TokenBasedRememberMeServices;

@Configuration
@EnableWebMvcSecurity
class SecurityConfig extends WebSecurityConfigurerAdapter {

//    @Bean
//    public UserService userService() {
//        return new UserService();
//    }

//    @Bean
//    public TokenBasedRememberMeServices rememberMeServices() {
//        //return new TokenBasedRememberMeServices("remember-me-key", userService());
//        return new TokenBasedRememberMeServices("remember-me-key", null);
//    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new StandardPasswordEncoder();
	}

    @Override
	public void configure(WebSecurity web) throws Exception {
		// 设置不拦截规则
		web.ignoring().antMatchers("/static/**", "/**/*.jsp");

	}
    
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//        auth
//            .eraseCredentials(true)
//            .userDetailsService(userService())
//            .passwordEncoder(passwordEncoder());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
//        http
//            .authorizeRequests()
//                .antMatchers("/", "/favicon.ico", "/resources/**", "/signup").permitAll()
//                .anyRequest().authenticated()
//                .and()
//            .formLogin()
//                .loginPage("/signin")
//                .permitAll()
//                .failureUrl("/signin?error=1")
//                .loginProcessingUrl("/authenticate")
//                .and()
//            .logout()
//                .logoutUrl("/logout")
//                .permitAll()
//                .logoutSuccessUrl("/signin?logout")
//                .and()
//            .rememberMe()
//                .rememberMeServices(rememberMeServices())
//                .key("remember-me-key");
    }
    
//    @Bean
//	public LoggerListener loggerListener() {
//		LoggerListener loggerListener = new LoggerListener();
//
//		return loggerListener;
//	}
//
//	@Bean
//	public org.springframework.security.access.event.LoggerListener eventLoggerListener() {
//		org.springframework.security.access.event.LoggerListener eventLoggerListener = new org.springframework.security.access.event.LoggerListener();
//
//		return eventLoggerListener;
//	}
//
//	/*
//	 * 
//	 * 这里可以增加自定义的投票器
//	 */
//	@SuppressWarnings("rawtypes")
//	@Bean(name = "accessDecisionManager")
//	public AccessDecisionManager accessDecisionManager() {
//		List<AccessDecisionVoter> decisionVoters = new ArrayList<AccessDecisionVoter>();
//		decisionVoters.add(new RoleVoter());
//		decisionVoters.add(new AuthenticatedVoter());
//		decisionVoters.add(webExpressionVoter());// 启用表达式投票器
//
//		AffirmativeBased accessDecisionManager = new AffirmativeBased(
//				decisionVoters);
//
//		return accessDecisionManager;
//	}
//
//	/*
//	 * 表达式控制器
//	 */
//	@Bean(name = "expressionHandler")
//	public DefaultWebSecurityExpressionHandler webSecurityExpressionHandler() {
//		DefaultWebSecurityExpressionHandler webSecurityExpressionHandler = new DefaultWebSecurityExpressionHandler();
//		return webSecurityExpressionHandler;
//	}
//
//	/*
//	 * 表达式投票器
//	 */
//	@Bean(name = "expressionVoter")
//	public WebExpressionVoter webExpressionVoter() {
//		WebExpressionVoter webExpressionVoter = new WebExpressionVoter();
//		webExpressionVoter.setExpressionHandler(webSecurityExpressionHandler());
//		return webExpressionVoter;
//	}
}