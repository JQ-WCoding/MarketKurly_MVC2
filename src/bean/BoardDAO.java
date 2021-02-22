package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
    private BoardDAO() {
    }

    private static BoardDAO instance = new BoardDAO();

    public static BoardDAO getInstance() {
        return instance;
    }

    Connection conn;
    PreparedStatement pstmt;
    ResultSet rs;

    private Connection getConnection() throws Exception {
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource) envCtx.lookup("jdbc/pool");
        conn = ds.getConnection();
        return conn;
    }

    /**
     * 전체 게시판 수 구하기
     *
     * @return
     */
    public int getAllBoardCount() {
        int count = 0;

        try {
            conn = getConnection();

            String sql = "SELECT COUNT(*) FROM board";
            pstmt = conn.prepareStatement(sql);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException sql) {
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sql) {
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sql) {
                }
            }
        }

        return count;
    }

    /**
     * 특정부분 게시판 가져오기
     *
     * @param start
     * @param count
     * @return ArrayList
     */
    public ArrayList<BoardDTO> getAllBoardList(int start, int count) {

        ArrayList<BoardDTO> boardList = new ArrayList<BoardDTO>();

        try {
            conn = getConnection();

            String sql = "SELECT * FROM board ORDER BY ref DESC, re_level LIMIT ?, ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, start);
            pstmt.setInt(2, count);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                BoardDTO dto = new BoardDTO();

                dto.setNum(rs.getInt("num"));
                dto.setWriter(rs.getString("writer"));
                dto.setTitle(rs.getString("title"));
                dto.setPw(rs.getString("pw"));
                dto.setReg_date(rs.getString("reg_date"));
                dto.setRef(rs.getInt("ref"));
                dto.setRe_step(rs.getInt("re_step"));
                dto.setRe_level(rs.getInt("re_level"));
                dto.setReadcount(rs.getInt("readcount"));
                dto.setContent(rs.getString("content"));

                boardList.add(dto);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException sql) {
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sql) {
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sql) {
                }
            }
        }

        return boardList;
    }

    /**
     * 게시판 글 추가하기
     *
     * @param dto
     */
    public void insertBoard(BoardDTO dto) {
        try {
            int ref = 0;
            int num = 0;

            conn = getConnection();

            String numSql = "SELECT MAX(num) FROM board";
            pstmt = conn.prepareStatement(numSql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                num = rs.getInt(1) + 1;
            }

            String refSql = "SELECT MAX(ref) FROM board";
            pstmt = conn.prepareStatement(refSql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                ref = rs.getInt(1) + 1;
            }

            String sql = "INSERT INTO board (num , writer, title, pw, reg_date, ref, re_step, re_level, readcount, content, status) VALUES(?, ?, ?, ?, now(),?, 1, 1, 0, ?, 'incomplete')";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, num);
            pstmt.setString(2, dto.getWriter());
            pstmt.setString(3, dto.getTitle());
            pstmt.setString(4, dto.getPw());
            pstmt.setInt(5, ref);
            pstmt.setString(6, dto.getContent());

            pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException sql) {
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sql) {
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sql) {
                }
            }
        }
    }

    /**
     * 선택한 게시판 가져오기
     *
     * @param num
     * @return기 BoardDTO
     */
    public BoardDTO getOneBoard(int num) {

        BoardDTO dto = new BoardDTO();

        try {
            conn = getConnection();

            String readSql = "UPDATE board SET readcount=readcount+1 WHERE num=?";
            pstmt = conn.prepareStatement(readSql);
            pstmt.setInt(1, num);
            pstmt.executeUpdate();

            String sql = "SELECT * FROM board WHERE num=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, num);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                dto.setNum(rs.getInt("num"));
                dto.setWriter(rs.getString("writer"));
                dto.setTitle(rs.getString("title"));
                dto.setPw(rs.getString("pw"));
                dto.setReg_date(rs.getString("reg_date"));
                dto.setRef(rs.getInt("ref"));
                dto.setRe_step(rs.getInt("re_step"));
                dto.setRe_level(rs.getInt("re_step"));
                dto.setReadcount(rs.getInt("readcount"));
                dto.setContent(rs.getString("content"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException sql) {
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sql) {
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sql) {
                }
            }
        }

        return dto;
    }

    /**
     * 게시판 수정하기
     *
     * @param num
     * @param title
     * @param content
     */
    public void updateBoard(int num, String title, String content) {
        try {
            conn = getConnection();

            String sql = "UPDATE board SET title=?, content=? WHERE num=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, title);
            pstmt.setString(2, content);
            pstmt.setInt(3, num);

            pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException sql) {
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sql) {
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sql) {
                }
            }
        }
    }

    /**
     * 게시판 삭제하기
     *
     * @param num
     */
    public void deleteBoard(int num) {
        try {
            conn = getConnection();

            String sql = "DELETE FROM board WHERE num=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, num);
            pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException sql) {
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sql) {
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sql) {
                }
            }
        }

    }

    public void writeAnswer(BoardDTO dto, BoardDTO bDTO) {
        int ref = bDTO.getRef();
        int re_step = bDTO.getRe_step();
        int re_level = bDTO.getRe_level();

        int num = 0;

        try {
            conn = getConnection();

            // board의 num 값중 최대 값 가져오기
            String numSql = "SELECT MAX(num) FROM board";
            pstmt = conn.prepareStatement(numSql);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                // 최대값 + 1
                num = rs.getInt(1) + 1;
            }

            // 상태 창 업데이트
            String statusSql = "UPDATE board SET status='complete' WHERE ref=? and re_step=? and re_level>?";
            pstmt = conn.prepareStatement(statusSql);
            pstmt.setInt(1, ref);
            pstmt.setInt(2, re_step);
            pstmt.setInt(3, re_level);
            pstmt.executeUpdate();

            // 현재 게시글의 re_level++
            String levelSql = "UPDATE board SET re_level=re_level+1 WHERE ref=? and re_level=?";
            pstmt = conn.prepareStatement(levelSql);
            pstmt.setInt(1, ref);
            pstmt.setInt(2, re_level);

            // 업데이트 완료
            pstmt.executeUpdate();

            // 답장하기
            String sql = "INSERT INTO board (num , writer, title, pw, reg_date, ref, re_step, re_level, readcount, content, status) VALUES (?,?,?,?,now(),?,?,?,0,?,'admin')";
            pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, num);
            pstmt.setString(2, dto.getWriter());
            pstmt.setString(3, dto.getTitle());
            pstmt.setString(4, dto.getPw());
            pstmt.setInt(5, ref);
            pstmt.setInt(6, re_step + 1);
            pstmt.setInt(7, re_level + 1);
            pstmt.setString(8, dto.getContent());
            pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException sql) {
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sql) {
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sql) {
                }
            }
        }
    }
}
