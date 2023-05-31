package com.scheduling.project.system.schedule.service.impl;

import java.util.List;
import com.scheduling.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.scheduling.project.system.schedule.mapper.ScheduleMapper;
import com.scheduling.project.system.schedule.domain.Schedule;
import com.scheduling.project.system.schedule.service.IScheduleService;
import com.scheduling.common.utils.text.Convert;

/**
 * 排班管理Service业务层处理
 *
 * @author scheduling
 * @date 2023-02-20
 */
@Service
public class ScheduleServiceImpl implements IScheduleService
{
    @Autowired
    private ScheduleMapper scheduleMapper;

    /**
     * 查询排班管理
     *
     * @param id 排班管理主键
     * @return 排班管理
     */
    @Override
    public Schedule selectScheduleById(Long id)
    {
        return scheduleMapper.selectScheduleById(id);
    }

    /**
     * 查询排班管理列表
     *
     * @param schedule 排班管理
     * @return 排班管理
     */
    @Override
    public List<Schedule> selectScheduleList(Schedule schedule)
    {
        return scheduleMapper.selectScheduleList(schedule);
    }

    /**
     * 新增排班管理
     *
     * @param schedule 排班管理
     * @return 结果
     */
    @Override
    public int insertSchedule(Schedule schedule)
    {
        schedule.setCreateTime(DateUtils.getNowDate());
        return scheduleMapper.insertSchedule(schedule);
    }

    /**
     * 修改排班管理
     *
     * @param schedule 排班管理
     * @return 结果
     */
    @Override
    public int updateSchedule(Schedule schedule)
    {
        schedule.setUpdateTime(DateUtils.getNowDate());
        return scheduleMapper.updateSchedule(schedule);
    }

    /**
     * 批量删除排班管理
     *
     * @param ids 需要删除的排班管理主键
     * @return 结果
     */
    @Override
    public int deleteScheduleByIds(String ids)
    {
        return scheduleMapper.deleteScheduleByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除排班管理信息
     *
     * @param id 排班管理主键
     * @return 结果
     */
    @Override
    public int deleteScheduleById(Long id)
    {
        return scheduleMapper.deleteScheduleById(id);
    }
}
