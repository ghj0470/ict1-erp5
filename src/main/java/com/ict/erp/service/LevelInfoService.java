package com.ict.erp.service;

import java.util.List;

import com.ict.erp.vo.LevelInfo;

public interface LevelInfoService {
       public List<LevelInfo>getLevelInfoList(LevelInfo li);
       public int insertLevelInfo(LevelInfo li);
       public int deleteLevelInfo(int linum);
       public int updateLevelInfo(LevelInfo li);
       public LevelInfo getLevelInfo(Integer linum);
}
