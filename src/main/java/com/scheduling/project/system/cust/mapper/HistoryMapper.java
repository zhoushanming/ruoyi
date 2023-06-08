package com.scheduling.project.system.cust.mapper;



import com.scheduling.project.system.cust.domain.History;

import java.util.List;

public interface HistoryMapper {

    /**
     * 查询员工管理列表
     *
     * @param history 员工管理
     * @return 员工管理集合
     */
    public List<History> selectHistoryList(History history);

    /**
     * 新增员工管理
     *
     * @param history 员工管理
     * @return 结果
     */
    public int insertHistory(History history);
}
