package com.green.security.config;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.BeanIds;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.oauth2.client.CommonOAuth2Provider;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.client.InMemoryOAuth2AuthorizedClientService;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClientService;
import org.springframework.security.oauth2.client.endpoint.NimbusAuthorizationCodeTokenResponseClient;
import org.springframework.security.oauth2.client.endpoint.OAuth2AccessTokenResponseClient;
import org.springframework.security.oauth2.client.endpoint.OAuth2AuthorizationCodeGrantRequest;
import org.springframework.security.oauth2.client.oidc.userinfo.OidcUserService;
import org.springframework.security.oauth2.client.registration.ClientRegistration;
import org.springframework.security.oauth2.client.registration.ClientRegistrationRepository;
import org.springframework.security.oauth2.client.registration.InMemoryClientRegistrationRepository;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserService;
import org.springframework.security.oauth2.client.web.AuthorizationRequestRepository;
import org.springframework.security.oauth2.client.web.HttpSessionOAuth2AuthorizationRequestRepository;
import org.springframework.security.oauth2.core.endpoint.OAuth2AuthorizationRequest;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.RequestContextListener;

import com.green.oauth2.service.CustomOAuth2UserService;
import com.green.oauth2.service.CustomOidcUserService;
import com.green.security.service.CustomUserDetailsService;
import com.green.security.utils.CustomLoginSuccessHandler;

import lombok.Setter;

@PropertySource("classpath:/application.properties")
@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Setter(onMethod_=@Autowired)
	private Environment env;
	
	@Autowired
	private DataSource dataSource;
	
	private static List<String> clients = Arrays.asList("google", "facebook");
	//application.properties 의 값을 가져오기 위해
	private static String CLIENT_PROPERTY_KEY = "spring.security.oauth2.client.registration.";
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		
		http	.csrf().disable()
		.authorizeRequests()
		.antMatchers("/library", "/wishlist").hasRole("MEMBER")
		//해당 경로에 대한 권한 설정
		.antMatchers("/oauth_login", "/login/oauth2/code/**").permitAll()
		//나머지 요청들의 권한 설정
		.anyRequest().permitAll();
		
		http
		.formLogin()
		.loginPage("/user/login")
		.loginProcessingUrl("/processingLogin")
		.successHandler(authenticationSuccessHandler())
		.failureUrl("/user/login?error=error")
		.and().userDetailsService(userDetailsService());
		
		http
		.oauth2Login()
		
			.loginPage("/")
			.defaultSuccessUrl("/", true)
			// client id, client secret, redirect uri  등 을 저장
			.clientRegistrationRepository(clientRegistrationRepository())
			//loadAuthorizedClient() 로 클라이언트 정보를 가져올 수 있음
			.authorizedClientService(authorizedClientService())
			//토큰이 발급되는 끝점
			.tokenEndpoint()
			//redirect uri 로 유저로부터 받은 authorization 코드를 이용해 구글(authorization sever) 에서 accessToken 으로 교체해줌
			.accessTokenResponseClient(accessTokenResponseClient())
			.and()
			//Resource owner의 권한을 Client가 이용하기 위해 저장함
			.authorizationEndpoint()
			.baseUri("/oauth2/authorization").and()
			//권한 부여를 기억하기 위해 쓴다. Authorization Request 를 저장
//			.authorizationRequestRepository(authorizationRequestRepository()).and()
//			
			//userInfoEndpoint 는 accessToken 을 이용해 리소스 오너의 리소스를 가져오는 url 
			.userInfoEndpoint()
			.userService(userService())
			.oidcUserService(oidcUserService());
		
		http.rememberMe().userDetailsService(userDetailsService())
		.tokenRepository(persistentTokenRepository());
		
		http
		.logout()
			.logoutUrl("/logout")
			.logoutSuccessUrl("/")
			.invalidateHttpSession(true)
			//for spring security
			.clearAuthentication(true)
			
			.deleteCookies("JSESSIONID");
		
	}
	
	@Override
	public void configure(WebSecurity web) throws Exception {
		// TODO Auto-generated method stub
		web.ignoring()
		.antMatchers("/resources/**")
		.antMatchers("/css/**").antMatchers("/js/**").antMatchers("/img/**").antMatchers("/vendor/**");
	}
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		// TODO Auto-generated method stub
		auth.userDetailsService(userDetailsService()).passwordEncoder(passwordEncoder());
	}

	
	
	//Resource Server가 갖고있는 client 정보를 반환
	@Bean
	public ClientRegistrationRepository clientRegistrationRepository() {
		
		List<ClientRegistration> registrations = clients.stream()
				//client id와 secret을 갖는 CommonOAuth2Provider 객체로 변환
				.map(c -> getRegistration(c))
				.filter(registration -> registration != null)
				.collect(Collectors.toList());
		
		registrations.forEach(i -> System.out.println(i.getClientId()));

		//Client 정보가 담김
		return new InMemoryClientRegistrationRepository(registrations);
	} 
	
	private ClientRegistration getRegistration(String client) {
		String clientId = env.getProperty(
				//Environment로 properties설정을 가져옴
				CLIENT_PROPERTY_KEY + client + ".client-id");
		
		
		
		if(clientId == null) {
			return null;
		}
		
		String clientSecret = env.getProperty(
				CLIENT_PROPERTY_KEY + client + ".client-secret");
		
		System.out.println("=======================================");
		System.out.println("clientId".toString() + clientId);
		System.out.println("=======================================");
		//CommonOAuth2Provider에는 enum 값으로 Google ,Facebook, Github , Okta 가 있다.
		//redirect uri 등이 정의돼있음.
		if (client.equals("google")) {
			return CommonOAuth2Provider.GOOGLE.getBuilder(client)
					.clientId(clientId).clientSecret(clientSecret).build();
		}
		
		if(client.equals("facebook")) {
			return CommonOAuth2Provider.FACEBOOK.getBuilder(client)
					.clientId(clientId).clientSecret(clientSecret).build();
		}
		
		return null;
	}
	
	@Bean
	public OAuth2AuthorizedClientService authorizedClientService() {
		return new InMemoryOAuth2AuthorizedClientService(
				clientRegistrationRepository());
	}
	
	@Bean
	public AuthorizationRequestRepository<OAuth2AuthorizationRequest>
		authorizationRequestRepository(){
		
		return new HttpSessionOAuth2AuthorizationRequestRepository();
	}
	
	@Bean
	public OAuth2AccessTokenResponseClient<OAuth2AuthorizationCodeGrantRequest>
		accessTokenResponseClient(){
		return new NimbusAuthorizationCodeTokenResponseClient();
	}
	
	@Bean(name = BeanIds.AUTHENTICATION_MANAGER)
   @Override
   public AuthenticationManager authenticationManagerBean() throws Exception {
       return super.authenticationManagerBean();
   }
	
	//UserInfo EndPoint (로그인한 유저의 정보를 담은 리소스) 를 처리
	@Bean
	public OAuth2UserService userService() {
		return new CustomOAuth2UserService();
	}
	//google 용 user service
	@Bean
	public OidcUserService oidcUserService() {
		return new CustomOidcUserService();
	}

	//일반 로그인을 위한 bean들
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	public UserDetailsService userDetailsService() {
		return new CustomUserDetailsService();
	}
	@Bean
	public AuthenticationSuccessHandler authenticationSuccessHandler() {
		return new CustomLoginSuccessHandler();
	}
	
	@Bean
	public PersistentTokenRepository persistentTokenRepository() {
		JdbcTokenRepositoryImpl jdbcTokenRepository = new JdbcTokenRepositoryImpl();
		jdbcTokenRepository.setDataSource(dataSource);
		return jdbcTokenRepository;
	}
	
}
