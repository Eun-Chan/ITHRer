package com.spring.ithrer.common.typehandler;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

public class StringArrayTypeHandler implements TypeHandler<String[]> {

	@Override
	public void setParameter(PreparedStatement pstmt, int columIndex, String[] param, JdbcType jdbcType) throws SQLException {
		if(param != null) {
			pstmt.setString(columIndex, String.join(",", param));
		}else {
			pstmt.setString(columIndex, "");
		}
		
	}

	@Override
	public String[] getResult(ResultSet rs, String columnName) throws SQLException {
		// 질의결과
		
		String str = rs.getString(columnName);
		String[] strArr = null;
		
		if(str != null) strArr = str.split(",");
		
		return strArr;
	}

	@Override
	public String[] getResult(ResultSet rs, int columnIndex) throws SQLException {
		// 질의결과
		String str = rs.getString(columnIndex);
		String[] strArr = null;
		
		if(str != null) strArr = str.split(",");
		
		return strArr;
	}

	@Override
	public String[] getResult(CallableStatement cstmt, int columnIndex) throws SQLException {
		// 프로시저 요청
		
		String str = cstmt.getString(columnIndex);
		String[] strArr = null;
		
		if(str != null) strArr = str.split(",");
		
		return strArr;
	}

}
