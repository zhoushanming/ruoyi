package com.scheduling.project.system.customer.service.impl;

import com.scheduling.project.system.customer.domain.Customer;
import com.scheduling.project.system.customer.mapper.CustomerMapper;
import com.scheduling.project.system.customer.service.ICustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 员工管理Service业务层处理
 *
 * @author scheduling
 * @date 2023-02-14
 */
@Service
public class CustomerServiceImpl implements ICustomerService {
    @Autowired
    private CustomerMapper CustomerMapper;


    /**
     * 查询员工管理列表
     *
     * @param Customer 员工管理
     * @return 员工管理
     */
    @Override
    public List<Customer> selectCustomerList(Customer Customer) {
        return CustomerMapper.selectCustomerList(Customer);
    }


}
