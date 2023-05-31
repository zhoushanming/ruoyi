package com.scheduling.project.monitor.job.util;

import org.quartz.JobExecutionContext;
import com.scheduling.project.monitor.job.domain.Job;

/**
 * 定时任务处理（允许并发执行）
 *
 * @author scheduling
 *
 */
public class QuartzJobExecution extends AbstractQuartzJob
{
    @Override
    protected void doExecute(JobExecutionContext context, Job job) throws Exception
    {
        JobInvokeUtil.invokeMethod(job);
    }
}
