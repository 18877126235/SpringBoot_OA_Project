package com.nnxy.ldq.model.dao.notedao;

import com.nnxy.ldq.model.entity.note.Noteuser;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface NoteUserDao extends PagingAndSortingRepository<Noteuser, Long>{

	@Query("select n.id from Noteuser n where n.noteId=?1 and n.userId=?2")
	Long findid(long noteid, long userid);
}
