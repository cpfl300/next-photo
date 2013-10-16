package org.nhnnext.repository;

import java.util.List;

import org.nhnnext.web.AttachComment;
import org.nhnnext.web.Board;
import org.springframework.data.repository.CrudRepository;

public interface AttachCommentRepository extends CrudRepository<AttachComment, Long>{
	List<AttachComment> findByBoard(Board board);
}
