package com.khd.Member.model.dao;


import com.khd.model.Member;

public interface MemberDao {

	boolean join(Member member);
//	boolean find(Member member);
//	boolean confirm(Member member);

		int check(String id);
		int echeck(String email);
//	 public int modify(Member member);
		Member mypage(String id);
		Member modify(Member member);
//	Member viewMember(String id);
//		Member delete(Member member);

		int delete(String id);
		String find_id(String email);
		String find_pwd(String id);
//		int deletemodify(String id);
}	
