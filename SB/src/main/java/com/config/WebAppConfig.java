package com.config;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.filter.HiddenHttpMethodFilter;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@EnableWebMvc
public class WebAppConfig implements WebMvcConfigurer {

	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/user.login").setViewName("user/html/NewLogin.html");
		registry.addViewController("/user.signup").setViewName("user/html/register.html");
		registry.addViewController("/user.oldSignup").setViewName("user/html/SignUp.html");
		registry.addViewController("/ManagerIndex").setViewName("ManagerIndex.jsp");
		registry.addViewController("/match.insertGoal").setViewName("match/jsp/InsertGoal.jsp");
		registry.addViewController("/match.UsersMatch").setViewName("match/html/UsersMatch.html");
		registry.addViewController("/match.MatchPage").setViewName("match/jsp/MatchPage.jsp");
		registry.addViewController("/match.HeartLoading").setViewName("match/jsp/HeartLoading.jsp");
		registry.addViewController("/match.Success").setViewName("match/jsp/SuccessPage.jsp");
		registry.addViewController("/match.Test").setViewName("chat/Test.jsp");
		registry.addViewController("/activityHomepage").setViewName("activity/HomePage.html");
		registry.addViewController("/activityInsertpage").setViewName("activity/Insert.html");
		registry.addViewController("/activityEventDetail").setViewName("activity/EventDetail.jsp");
		registry.addViewController("/activityList").setViewName("activity/EventList.html");
		registry.addViewController("/activityAllRegistrations").setViewName("activity/DisplayAllRegistrations.jsp");
		registry.addViewController("/forum.homepage").setViewName("/forum/frontdesk/Home.html");
		registry.addViewController("/forum.InsertPosts").setViewName("/forum/backstage/posts/jsp/InsertPosts.jsp");
		registry.addViewController("/forum.InsertCategories").setViewName("forum/backstage/categories/html/InsertCategories.html");
		registry.addViewController("/forumManager.homepage").setViewName("forum/backstage/ManagerHome.html");
		registry.addViewController("/test.homepage").setViewName("forum/frontdesk/testForum.html");
		
		//前台後台範例
		registry.addViewController("/Example").setViewName("test/Z_index_useScriptImport.html");
		registry.addViewController("/backStageExample").setViewName("test/Z_backstageExample.html");
		registry.addViewController("/fontStageExample").setViewName("test/Z_fontStageExample.html");
		
		registry.addViewController("/getLinePayPay").setViewName("group/html/linpay.html");

		
		registry.addViewController("/adger.test").setViewName("test/webSocketTest.html");
		registry.addViewController("/forgotPassword").setViewName("user/html/forgot-password.html");
		registry.addViewController("/resetPassword").setViewName("user/html/reset-password.html");
		registry.addViewController("/resetPasswordSuccess").setViewName("user/html/resetPasswordSuccess.html");
		registry.addViewController("/sendMailSuccess").setViewName("user/html/sendMailSuccess.html");
	}
	

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/mycss/**").addResourceLocations("/WEB-INF/resources/mycss/");
		registry.addResourceHandler("/css/**").addResourceLocations("/WEB-INF/resources/mycss/");
		registry.addResourceHandler("/vendor/**").addResourceLocations("/WEB-INF/resources/vendor/");
		registry.addResourceHandler("/images/**").addResourceLocations("/WEB-INF/resources/images/");
		registry.addResourceHandler("/resourceImages/**").addResourceLocations("/WEB-INF/resources/images/");
		registry.addResourceHandler("/groupimages/**").addResourceLocations("file:/C:/temp/upload/");
		registry.addResourceHandler("/localimages/**").addResourceLocations("file:/C:/temp/upload/");
		registry.addResourceHandler("/forumimages/**").addResourceLocations("file:/C:/temp/upload/");
		registry.addResourceHandler("/js/**").addResourceLocations("/WEB-INF/resources/js/");
		registry.addResourceHandler("/json/**").addResourceLocations("/WEB-INF/resources/json/");
	}

	
	//要在WEB_INF內讀取html需要加這一個設定檔~
	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}
	
	@Bean
	public InternalResourceViewResolver viewResolver() {
	    InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
	    viewResolver.setPrefix("/WEB-INF/pages/");
//	    viewResolver.setSuffix(".jsp");
	    return viewResolver;
	}
	
	
	//加這個才看得懂delete跟put
	@Bean
    public FilterRegistrationBean<HiddenHttpMethodFilter> hiddenHttpMethodFilter() {
        FilterRegistrationBean<HiddenHttpMethodFilter> filterRegBean = new FilterRegistrationBean<>(new HiddenHttpMethodFilter());
        filterRegBean.getUrlPatterns().add("/*");
        return filterRegBean;
    }
	
	

}
