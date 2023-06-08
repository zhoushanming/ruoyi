package com.scheduling.project.system.cust.service.impl;

import com.scheduling.project.system.cust.domain.History;
import com.scheduling.project.system.cust.mapper.HistoryMapper;
import com.scheduling.project.system.cust.service.ICustService;
import com.scheduling.project.system.cust.service.IHistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
@Service
public class HistoryServiceImpl implements IHistoryService {
    @Autowired
    private HistoryMapper historyMapper;
    @Override
    public List<History> selectHistoryList(History history) {
        return historyMapper.selectHistoryList(history);
    }

    @Override
    public int insertHistory(History history) {
        history.setOperateDate(new Date());
        int rows = historyMapper.insertHistory(history);
        return rows;
    }
}
