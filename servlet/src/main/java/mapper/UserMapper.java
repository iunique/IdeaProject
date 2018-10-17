package mapper;

import entity.User;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
@Mapper
@Repository
public interface UserMapper{
    @Select("select * from user where id = #{id}")
    public User findUser(String id);
    @Insert("insert into user(id,code,mail,time) values(#{id},#{code},#{mail},default)")
    public int insertUser(User user);
    @Delete("delete from user where id = #{id}")
    public int deleteUser(String id);
}
