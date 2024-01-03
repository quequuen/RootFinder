package com.RootFinder.controller;

import com.RootFinder.controller.action.Action;
import com.RootFinder.controller.action.AdminDeleteCommentAction;
import com.RootFinder.controller.action.AdminDeleteCommentView;
import com.RootFinder.controller.action.AdminDeleteCoseView;
import com.RootFinder.controller.action.AdminDeleteUserInfAction;
import com.RootFinder.controller.action.AdminDeleteUserInfView;
import com.RootFinder.controller.action.AdminUpadteUserinfView;
import com.RootFinder.controller.action.AdminUpdateCommentAction;
import com.RootFinder.controller.action.AdminUpdateCommentView;
import com.RootFinder.controller.action.AdminUpdateCoseAction;
import com.RootFinder.controller.action.AdminUpdateCoseView;
import com.RootFinder.controller.action.AdminUpdateUserInfAction;
import com.RootFinder.controller.action.AgeGenderListViewAction;
import com.RootFinder.controller.action.CheckBeforeBackToMainAction;
import com.RootFinder.controller.action.IdCheckDoAction;
import com.RootFinder.controller.action.JoinDoAction;
import com.RootFinder.controller.action.JoinViewAction;
import com.RootFinder.controller.action.LocalCoseViewAction;
import com.RootFinder.controller.action.LocalSearchViewAction;
import com.RootFinder.controller.action.LoginDoAction;
import com.RootFinder.controller.action.LoginViewAction;
import com.RootFinder.controller.action.LogoutDoAction;
import com.RootFinder.controller.action.MBTIFullListViewAction;
import com.RootFinder.controller.action.MainpageListAction;
import com.RootFinder.controller.action.MyCourseFormAction;
import com.RootFinder.controller.action.MyViewCoseFormAction;
import com.RootFinder.controller.action.NickNameCheckDoAction;
import com.RootFinder.controller.action.ProfileUpdateAction;
import com.RootFinder.controller.action.ProfileUploadAction;
import com.RootFinder.controller.action.ProfileUploadProcAction;
import com.RootFinder.controller.action.RootCommentAction;
import com.RootFinder.controller.action.RootCommentCheckAction;
import com.RootFinder.controller.action.RootInsertAction;
import com.RootFinder.controller.action.RootInsertFormAction;
import com.RootFinder.controller.action.RootScheduleFormAction;
import com.RootFinder.controller.action.RootSummaryFormAction;
import com.RootFinder.controller.action.RootWriteAction;
import com.RootFinder.controller.action.RootWriteFormAction;


public class ActionFactory {
	
	private ActionFactory()
	{
		
	}
	
	private static ActionFactory instance = new ActionFactory();
	
	public static ActionFactory getInstance()
	{
		return instance;
	}
	
	public Action getAction(String command)
	{
		Action action = null;
		System.out.println("ActionFactory : "+command);
		
		if(command.equals("mainpage_list"))
		{
			action  = new MainpageListAction();
		}
		else if(command.equals("login_view"))
		{
			action = new LoginViewAction();
		}
		else if(command.equals("login_do"))
		{
			action = new LoginDoAction();
		}
		else if(command.equals("join_view"))
		{
			action = new JoinViewAction();
		}
		else if(command.equals("join_do"))
		{
			action = new JoinDoAction();
		}
		else if(command.equals("idcheck_do"))
		{
			action = new IdCheckDoAction();
		}
		else if(command.equals("nicknamecheck_do"))
		{
			action = new NickNameCheckDoAction();
		}
		else if(command.equals("logout_do"))
		{
			action = new LogoutDoAction();
		}
		
		//여행지 클릭시
		else if(command.equals("local_cose_view"))
		{
			action = new LocalCoseViewAction();
		}
		
		//개요(루트 간단 정리)로 넘어가게 하는 폼액션 
		else if(command.equals("root_summary_form")){     
			
			action = new RootSummaryFormAction();
	
		}
		//일정표로 넘어가게 하는 폼 액션 
		else if(command.equals("root_schedule_form")) { 		
		
			action = new RootScheduleFormAction();
		
		}
		//댓글(로그인 되어 있는지 안되어 있는지 확인)
		else if(command.equals("root_comment_check")) {			
			
			action = new RootCommentCheckAction();
			
		}
		
		//마이페이지(지우 추가)
		else if (command.equals("profileUpload")) {
	         action = new ProfileUploadAction();
	      } else if (command.equals("profileUploadProc")) {
	         action = new ProfileUploadProcAction();
	      }
		
		//코스 등록(민준 추가)
        else if (command.equals("root_write")) {
    	  action = new RootWriteAction();
		} else if (command.equals("root_insert")) {
			action = new RootInsertAction();
		} else if(command.equals("root_write_form")) {
			action = new RootWriteFormAction();
		}
		else if(command.equals("root_insert_form")) {
			action = new RootInsertFormAction();
		}
		//MBTI 코스 추천에서 추천 일정 더보기 클릭시 나타나는 화면
		else if(command.equals("mbti_full_list"))
		{
			action = new MBTIFullListViewAction();
		}
		//나이랑 성별에 따른 코스 추천에서 추천 일정 더보기 클릭 시 나타나는 화면
		else if(command.equals("age_gender_full_list"))
		{
			action = new AgeGenderListViewAction();
		}
		//검색 후 나타나는 화면
		else if(command.equals("local_search_view"))
		{
			action = new LocalSearchViewAction();
		}
		else if(command.equals("root_summary_form")){     
	         action = new RootSummaryFormAction();
	      }

	      //댓글 등록 (가연 추가)

	      else if(command.equals("root_comment_action")) {
	         action = new RootCommentAction();
	      }
	//로그인 확인 후 넘어가는 메인페이지(가연 추가)
	      else if(command.equals("check_before_back_to_main")) {
	         action = new CheckBeforeBackToMainAction();
	      }
		
		//내가 조회한 코스 보기
	      else if(command.equals("my_view_cose"))
	      {
	    	  action = new MyViewCoseFormAction();
	      }
		//마이페이지 - 내가 올린 코스
	      else if(command.equals("my_cose"))
	      {
	    	  action = new MyCourseFormAction();
	      }

		
		 else if (command.equals("profile_update")) {
					action = new ProfileUpdateAction();
				}

		
//-----------------------[관리자]-----------------------------------
	      else if(command.equals("admin_update_userinf_view"))
	      {
	    	  action = new AdminUpadteUserinfView();
	      }
	      else if(command.equals("admin_delete_userinf_view"))
	      {
	    	  action = new AdminDeleteUserInfView();
	      }
	      else if(command.equals("admin_update_userinf_action"))
	      {
	    	  action = new AdminUpdateUserInfAction();
	      }else if(command.equals("admin_delete_userinf_action"))
	      {
	    	  action = new AdminDeleteUserInfAction();
	      }
	      else if(command.equals("admin_update_comment_view"))
	      {
	    	  action = new AdminUpdateCommentView();
	      }else if(command.equals("admin_update_comment_action"))
	      {
	    	  action = new AdminUpdateCommentAction();
	      }else if(command.equals("admin_delete_comment_view"))
	      {
	    	  action = new AdminDeleteCommentView();
	      }else if(command.equals("admin_delete_comment_action"))
	      {
	    	  action = new AdminDeleteCommentAction();
	      }else if(command.equals("admin_update_cose_view"))
	      {
	    	  action = new AdminUpdateCoseView();
	      }else if(command.equals("admin_cose_update"))
	      {
	    	  action = new AdminUpdateCoseAction();
	      }else if(command.equals("admin_delete_cose_view"))
	      {
	    	  action = new AdminDeleteCoseView();
	      }
		return action;
	}

}
