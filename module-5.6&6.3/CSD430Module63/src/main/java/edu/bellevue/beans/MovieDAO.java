package edu.bellevue.beans;

import java.sql.*;
import java.util.ArrayList;

public class MovieDAO {

    public ArrayList<Integer> getMovieIDs() {
        ArrayList<Integer> ids = new ArrayList<>();

        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT movieID FROM noormoviesdata";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ids.add(rs.getInt("movieID"));
            }

            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return ids;
    }

    public MovieBean getMovieByID(int movieID) {
        MovieBean movie = new MovieBean();

        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT * FROM noormoviesdata WHERE movieID = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, movieID);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                movie.setMovieID(rs.getInt("movieID"));
                movie.setTitle(rs.getString("title"));
                movie.setGenre(rs.getString("genre"));
                movie.setDirector(rs.getString("director"));
                movie.setReleaseYear(rs.getInt("releaseYear"));
            }

            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return movie;
    }
}