package com.rocket.code.persistence.mapper;

import com.rocket.code.persistence.model.TareaModel;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface ITareaMapper {
    @Select("SELECT * FROM tarea")
    List<TareaModel> findAll();

    @Select("SELECT * FROM tarea WHERE id = #{id}")
    TareaModel findById(Long id);

    @Select("SELECT * FROM tarea WHERE nombre = #{nombre}")
    TareaModel findByNombre(String nombre);

    @Insert("INSERT INTO tarea(nombre, descripcion, fecha_inicio) " +
            "VALUES(#{nombre}, #{descripcion}, #{fecha_inicio}")
    int insert(TareaModel tareaModel);

    @Update("UPDATE tarea SET nombre = #{nombre}, descripcion = #{descripcion}, fecha_inicio = #{fecha_inicio} " +
            "WHERE id = #{id}")
    int update(TareaModel tareaModel);

    @Delete("DELETE FROM tarea WHERE id = #{id}")
    int delete(Long id);

}
