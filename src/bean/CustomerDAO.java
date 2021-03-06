package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CustomerDAO {
    private CustomerDAO() {
    }

    private static CustomerDAO instance = new CustomerDAO();

    public static CustomerDAO getInstance() {
        return instance;
    }

    Connection conn;
    PreparedStatement pstmt;
    ResultSet rs;

    // connection pool
    private Connection getConnection() throws Exception {
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource) envCtx.lookup("jdbc/pool");
        conn = ds.getConnection();
        return conn;
    }

    public void insertCustomer(CustomerDTO dto) {

        try {
            conn = getConnection();

            String sql = "INSERT INTO customer VALUES(?, ?, ?, now(), ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, dto.getId());
            pstmt.setString(2, dto.getPw());
            pstmt.setString(3, dto.getName());
            pstmt.setString(4, dto.getTel());
            pstmt.setInt(5, dto.getPostcode());
            pstmt.setString(6, dto.getAddress());
            pstmt.setString(7, dto.getEmail());
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
        }
    }

    public int checkDoubleId(String id) {
        int check = 0;
        try {
            conn = getConnection();

            String sql = "SELECT id FROM customer WHERE id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                check = 1;
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

        return check;
    }

    public int checkDoubleEmail(String email) {
        int check = 0;

        try {
            conn = getConnection();

            String sql = "SELECT email FROM customer WHERE email=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                check = 1;
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

        return check;
    }

    public int userCheck(String id, String pw) {
        int check = 0;
        try {
            conn = getConnection();

            String sql = "SELECT * FROM customer WHERE id=? AND pw=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, pw);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                check = 1;
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

        return check;
    }

    public CustomerDTO getCustomerInfo(String id) {
        CustomerDTO dto = new CustomerDTO();

        try {
            conn = getConnection();

            String sql = "select * from customer where id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                dto.setId(rs.getString("id"));
                dto.setPw(rs.getString("pw"));
                dto.setName(rs.getString("name"));
                dto.setReg_date(rs.getString("reg_date"));
                dto.setTel(rs.getString("tel"));
                dto.setAddress(rs.getString("address"));
                dto.setEmail(rs.getString("email"));
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
     * 사용자 아이디 찾기
     *
     * @param name
     * @param email
     * @return id
     */
    public String findId(String name, String email) {
        String id = null;
        try {
            conn = getConnection();
            String sql = "SELECT * FROM customer WHERE name=? and email=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                id = rs.getString("id");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null)
                try {
                    conn.close();
                } catch (SQLException sqle) {
                }
            if (pstmt != null)
                try {
                    pstmt.close();
                } catch (SQLException sqle) {
                }
            if (rs != null)
                try {
                    rs.close();
                } catch (SQLException sqle) {
                }
        }
        System.out.println(" id 확인용 = " + id);
        return id;
    }

    /**
     * 비밀번호 찾기
     *
     * @param name
     * @param id
     * @param email
     * @return pw
     */
    public String findPw(String name, String id, String email) {
        String pw = null;
        try {
            conn = getConnection();
            String sql = "SELECT * FROM customer WHERE name=? and id=? and email=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, id);
            pstmt.setString(3, email);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                pw = rs.getString("pw");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null)
                try {
                    conn.close();
                } catch (SQLException sqle) {
                }
            if (pstmt != null)
                try {
                    pstmt.close();
                } catch (SQLException sqle) {
                }
            if (rs != null)
                try {
                    rs.close();
                } catch (SQLException sqle) {
                }
        }
        System.out.println(" pw 확인용 = " + pw);
        return pw;
    }
}



















