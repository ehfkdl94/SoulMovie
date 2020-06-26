package com.soulmovie.security;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

@Configuration  //환경설정파일 이라는뜻 서버가 돌기전에 먼저 완성되어야 하는것 서버가 돌기전에 하기 때문에 new를 쓰는게아니라 bean을써서 미리 만들어야한다.
@EnableWebSecurity  //Security사용한다는뜻
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	//새롭게 만든 UserDetailsService를 사용함.
	@Autowired
	CustomUserDetailService userDetailsService;
	
	@Bean
	public BCryptPasswordEncoder BCE() {
		return new BCryptPasswordEncoder();
	}
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		
		//새로만든 service객체 추가 + 암호화 방법 설정
		auth.userDetailsService(userDetailsService).passwordEncoder(BCE());
	}

	@Override
	public void configure(WebSecurity web) throws Exception {
		//Security사 적용되지 않는 url
		web.ignoring().antMatchers("/css/**","/script/**","/image/**","/fonts/**","/lib/**");
		
	}

	@Override
	protected void configure(HttpSecurity http ) throws Exception {
		http.authorizeRequests( )
			 	.antMatchers("/admin","/admin/*").hasAuthority("ADMIN")
			 	.antMatchers("/choice","/choice/*").hasAnyAuthority("ADMIN","USER")
				.antMatchers("/board/**").authenticated()
			 	.anyRequest().permitAll()
			 	.and()
//			 .formLogin()
//			 	.loginPage("/security/login")  //로그인 페이지 url
//			 	.loginProcessingUrl("/security/loginProcess")//<form action= "" 설정
//			 	.permitAll()    			//누구나 접근
//			 	.defaultSuccessUrl("/security/home") //성공시 이동할 페이지
//			 	.and()
			 .formLogin()
	        	.loginPage("/member/login")  //로그인 페이지 url
	        	.loginProcessingUrl("/loginProcess") //<form action="?"
	        	.failureUrl("/member/edit")//누구나 접근
	        	.defaultSuccessUrl("/") 	//성공시 이동할 페이지
	        	.successHandler(successHandler())
	        	.permitAll()
	        	.and()
			 .logout()
			 	.logoutUrl("/member/logout")  //로그아웃페이지
			 	.logoutSuccessUrl("/") //성공시 페이지
			 	.invalidateHttpSession(true)  // httpSession.invalidate 를 실행
			 	.clearAuthentication(true)///로그아웃 후 인증삭제
			 	.permitAll()
			 	.and()
			 .exceptionHandling()
			 	.accessDeniedPage("/page403");
		
		
			//보안에 취약함.
		    http.csrf().disable(); //csrf를 사용하지 않을 경우
				
		 	
//		 	.authorizeRequests()
//		 	.antMatchers("/security/manager","/security/manager/*").hasAuthority("MANAGER")
//		 	.anyRequest().permitAll()
//		 	.and()
		 	
	}
	

	  
	@Bean
	public AuthenticationSuccessHandler successHandler() {
	  return new CustomLoginSuccessHandler("/");//default로 이동할 url
	}


	
}
