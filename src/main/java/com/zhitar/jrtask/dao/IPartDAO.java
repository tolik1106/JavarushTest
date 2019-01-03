package com.zhitar.jrtask.dao;

import com.zhitar.jrtask.model.Part;

import java.util.List;

public interface IPartDAO {

    public List<Part> getAll(int sort);

    public Part getPart(String name);

    public void addPart(Part part);

    public void deletePart(Integer id);

    public Part getMinNecessaryPart();

    public List<Part> getByPage(int page);
}
