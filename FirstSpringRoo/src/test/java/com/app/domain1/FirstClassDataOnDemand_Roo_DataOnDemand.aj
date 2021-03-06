// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.app.domain1;

import com.app.domain1.FirstClass;
import com.app.domain1.FirstClassDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect FirstClassDataOnDemand_Roo_DataOnDemand {
    
    declare @type: FirstClassDataOnDemand: @Component;
    
    private Random FirstClassDataOnDemand.rnd = new SecureRandom();
    
    private List<FirstClass> FirstClassDataOnDemand.data;
    
    public FirstClass FirstClassDataOnDemand.getNewTransientFirstClass(int index) {
        FirstClass obj = new FirstClass();
        setName1(obj, index);
        return obj;
    }
    
    public void FirstClassDataOnDemand.setName1(FirstClass obj, int index) {
        String name1 = "name1_" + index;
        obj.setName1(name1);
    }
    
    public FirstClass FirstClassDataOnDemand.getSpecificFirstClass(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        FirstClass obj = data.get(index);
        Long id = obj.getId();
        return FirstClass.findFirstClass(id);
    }
    
    public FirstClass FirstClassDataOnDemand.getRandomFirstClass() {
        init();
        FirstClass obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return FirstClass.findFirstClass(id);
    }
    
    public boolean FirstClassDataOnDemand.modifyFirstClass(FirstClass obj) {
        return false;
    }
    
    public void FirstClassDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = FirstClass.findFirstClassEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'FirstClass' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<FirstClass>();
        for (int i = 0; i < 10; i++) {
            FirstClass obj = getNewTransientFirstClass(i);
            try {
                obj.persist();
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
