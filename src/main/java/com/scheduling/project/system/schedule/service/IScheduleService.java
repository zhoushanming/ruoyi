package com.scheduling.project.system.schedule.service;

import java.util.List;
import com.scheduling.project.system.schedule.domain.Schedule;

/**
 * 排班管理Service接口
 *
 * @author scheduling
 * @date 2023-02-20
 */
public interface IScheduleService
{
    /**
     * 查询排班管理
     *
     * @param id 排班管理主键
     * @return 排班管理
     */
    public Schedule selectScheduleById(Long id);

    /**
     * 查询排班管理列表
     *
     * @param schedule 排班管理
     * @return 排班管理集合
     */
    public List<Schedule> selectScheduleList(Schedule schedule);

    /**
     * 新增排班管理
     *
     * @param schedule 排班管理
     * @return 结果
     */
    public int insertSchedule(Schedule schedule);

    /**
     * 修改排班管理
     *
     * @param schedule 排班管理
     * @return 结果
     */
    public int updateSchedule(Schedule schedule);

    /**
     * 批量删除排班管理
     *
     * @param ids 需要删除的排班管理主键集合
     * @return 结果
     */
    public int deleteScheduleByIds(String ids);

    /**
     * 删除排班管理信息
     *
     * @param id 排班管理主键
     * @return 结果
     */
    public int deleteScheduleById(Long id);
}
