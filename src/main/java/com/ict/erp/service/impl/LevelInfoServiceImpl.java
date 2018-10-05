package com.ict.erp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.erp.dao.LevelInfoDAO;
import com.ict.erp.service.LevelInfoService;
import com.ict.erp.vo.LevelInfo;

@Service
public class LevelInfoServiceImpl implements LevelInfoService {
     
	@Autowired
	private LevelInfoDAO lidao;
	@Override
	public List<LevelInfo> getLevelInfoList(LevelInfo li) {
		return lidao.getLevelInfoList(li);
	}
	@Override
	public int insertLevelInfo(LevelInfo li) {
		// TODO Auto-generated method stub
		return lidao.insertLevelInfo(li);
	}
	@Override
	public int deleteLevelInfo(int linum) {
		// TODO Auto-generated method stub
		return lidao.deleteLevelInfo(linum);
	}
	@Override
	public int updateLevelInfo(LevelInfo li) {
		// TODO Auto-generated method stub
		return lidao.updateLevelInfo(li);
	}
	@Override
	public LevelInfo getLevelInfo(Integer linum) {
		// TODO Auto-generated method stub
		return lidao.getLevelInfoList(linum);
	}
	
	

}
