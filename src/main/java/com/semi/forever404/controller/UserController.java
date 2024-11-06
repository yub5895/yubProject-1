package com.semi.forever404.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.semi.forever404.model.vo.User;
import com.semi.forever404.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	@Autowired
	private UserService service;
	
	// 회원가입 - 생년월일은 date 타입이라 별도 처리
	@ResponseBody
	@PostMapping("/signUp")
	public void signUp(String id, String password, String phone, String name, String email, @RequestParam(name="birth", required=false) String birth) throws ParseException {
			if(!(birth.equals(""))) {
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
				Date date = formatter.parse(birth);
				User user = new User(id, password, phone, name, email, date);
				service.register(user);
			} else if(birth.equals("")){
				User user = new User(id, password, phone, name, email, null);
				service.register(user);
			}
	}
	// 사용자가 입력한 값을 user 객체 방식으로 받아 세션에 담은 후 null 여부로 로그인 
	@ResponseBody
	@PostMapping("/login")
		public boolean login(HttpServletRequest request, User user) {
			HttpSession session = request.getSession();
			session.setAttribute("user", service.login(user));
			if(session.getAttribute("user")!=null) {
				return true;
			}
			else return false;
		}
	
	// user 세션 날림
	@ResponseBody
	@PostMapping("/logout")
	public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("user")!=null) {
		session.invalidate();
		}
	}	
	// 이미 데이터베이스에 있는 카카오 아이디라면 회원가입 생략하고 로그인, 아니라면 데이터베이스에 넣어 자동 등록 후 로그인
	@ResponseBody
	@PostMapping("/kakaoLogin")
	public void kakaoLogin(@RequestParam("email") String email,
						   @RequestParam("name") String name,
						   @RequestParam("phone") String phone,
						   @RequestParam("birthday") String birthday,
						   @RequestParam("birthyear") String birthyear,
						   @RequestParam("token") String token,
						   HttpServletRequest request,
						   User user,
						   Model model
							) throws ParseException {
		
		String month = birthday.substring(0, 2);
		String day = birthday.substring(2, 4);
		String birth = birthyear + "-" + month + "-" + day;
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date date = formatter.parse(birth);
		HttpSession session = request.getSession();
		session.setAttribute("token", token);
		String newphone = phone.replace("+82 ", "0");
		User existingUser = service.kakaoLogin(email);
		if(existingUser !=null) {
			 session.setAttribute("user", existingUser);
		}else {
			 user = new User(email, token, newphone, name, email, date);
			 service.register(user);
			 session.setAttribute("user", user);
		} 
	}
	
	@ResponseBody
	@PostMapping("/myPage")
	public User myPage(User user, HttpServletRequest request) {
		HttpSession session = request.getSession();
		user = (User) session.getAttribute("user");
		return user;
	}
}
