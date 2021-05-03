package com.mySpring.springEx.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.mySpring.springEx.member.vo.MemberVO;


public class AuthViewInterceptor extends HandlerInterceptorAdapter {
   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
      // 1. handler 종류 확인
            // 우리가 관심 있는 것은 Controller에 있는 메서드이므로 HandlerMethod 타입인지 체크
            if( handler instanceof HandlerMethod == false ) {
               // return true이면  Controller에 있는 메서드가 아니므로, 그대로 컨트롤러로 진행
               return true;
            }
            // 2.형 변환
            HandlerMethod handlerMethod = (HandlerMethod)handler;
            
            // 3. @Auth 받아오기
            Auth auth = handlerMethod.getMethodAnnotation(Auth.class);
            
            // 4. method에 @Auth가 없는 경우, 즉 인증이 필요 없는 요청

            if( auth == null ) {
               return true;
            }
            
            // 5. @Auth가 있는 경우이므로, 세션이 있는지 체크
            HttpSession session = request.getSession();
            if( session == null ) {
               // 화면 없음 페이지로 이동

               response.sendRedirect(request.getContextPath() + "/noAuth.do");
               return false;
            }
            
            // 6. 세션이 존재하면 유효한 유저인지 확인
            MemberVO authUser = (MemberVO)session.getAttribute("member");
            if ( authUser == null ) {
               // 화면 없음 페이지로 이동

               response.sendRedirect(request.getContextPath() + "/noAuth.do");
               return false;
            }

            // 7. admin일 경우
            String role = auth.role().toString();
            System.out.println("현재 권한============="+role+"포지션============"+authUser.getUserPosition());
            if( "ADMIN".equals(role) ) {
               // admin임을 알 수 있는 조건을 작성한다.
               // ex) 서비스의 id가 root이면 admin이다.
               if( "ADMIN".equals(authUser.getUserPosition()) == false ){   // admin이 아니므로 return false

                  response.sendRedirect(request.getContextPath() + "/noAuth.do");
                  return false;
               }
            } else if("PARTNER".equals(role)) {
               // 협력사임을 알 수 있는 조건을 작성한다.
               // ex) 서비스의 id가 root이면 admin이다.
               if( "PARTNER".equals(authUser.getUserPosition()) == false ){   // partner가 아니므로 return false

                  response.sendRedirect(request.getContextPath() + "/noAuth.do");
                  return false;
               }
            } else if("CREW".equals(role)) {
               if("채용예정자".equals(authUser.getUserPosition()) == false) {
                  response.sendRedirect(request.getContextPath() + "/noAuth.do");
                  return false;
               }
            } else if("USER".equals(role)) {
                  if( "ADMIN".equals(authUser.getUserPosition()) == true ){   // ADMIN과 PARTNER인 경우, 권한이 없음 하나로 체크할 수 없어서 true로 체크
                     response.sendRedirect(request.getContextPath() + "/noAuth.do");
                     return false;
                  } else if( "PARTNER".equals(authUser.getUserPosition()) == true) {
                     response.sendRedirect(request.getContextPath() + "/noAuth.do");
                     return false;
                  }
            } else if("PA".equals(role)) {
               if( "재직자".equals(authUser.getUserPosition()) == true ){   // User중 채용예정자, 재직자, 일반회원이 아닌경우, 하나로 체크할 수 없어서 true로 체크
                  response.sendRedirect(request.getContextPath() + "/noAuth.do");
                  return false;
               } else if( "채용예정자".equals(authUser.getUserPosition()) == true) {
                  response.sendRedirect(request.getContextPath() + "/noAuth.do");
                  return false;
               } else if("재직자".equals(authUser.getUserPosition()) == true) {
                  response.sendRedirect(request.getContextPath() + "/noAuth.do");
                  return false;
               
               }
            } else if("NON_PA".equals(role)) {
               if( "PARTNER".equals(authUser.getUserPosition()) == true ){   // User중 채용예정자, 재직자, 일반회원이 아닌경우, 하나로 체크할 수 없어서 true로 체크

                  response.sendRedirect(request.getContextPath() + "/noAuth.do");
                  return false;
               } else if( "ADMIN".equals(authUser.getUserPosition()) == true) {
                  response.sendRedirect(request.getContextPath() + "/noAuth.do");
                  return false;
               }
            }
            // 8. 접근허가, 즉 메서드를 실행하도록 함
            return true;
   }
}