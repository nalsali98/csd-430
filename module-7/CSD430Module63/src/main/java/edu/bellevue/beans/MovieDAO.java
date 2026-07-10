package edu.bellevue.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 * Handles database operations for movie records.
 *
 * @author Noor Al Salihi
 */
public class MovieDAO {

    /**
     * Retrieves all movie IDs from the database.
     *
     * @return a list of movie IDs
     */
    public ArrayList<Integer> getMovieIDs() {

        ArrayList<Integer> ids = new ArrayList<>();

        try {
            Connection conn = DBConnection.getConnection();

            String sql = "SELECT movieID FROM noormoviesdata ORDER BY movieID";

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

    /**
     * Retrieves one movie record by its movie ID.
     *
     * @param movieID the movie primary key
     * @return the matching MovieBean object
     */
    public MovieBean getMovieByID(int movieID) {

        MovieBean movie = new MovieBean();

        try {
            Connection conn = DBConnection.getConnection();

            String sql =
                    "SELECT * FROM noormoviesdata WHERE movieID = ?";

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

    /**
     * Adds a new movie record to the database.
     * The movie ID is generated automatically by MySQL.
     *
     * @param movie the MovieBean containing the submitted data
     * @return true when the record is inserted successfully
     */
    public boolean addMovie(MovieBean movie) {

        boolean recordAdded = false;

        try {
            Connection conn = DBConnection.getConnection();

            String sql =
                    "INSERT INTO noormoviesdata " +
                            "(title, genre, director, releaseYear) " +
                            "VALUES (?, ?, ?, ?)";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, movie.getTitle());
            ps.setString(2, movie.getGenre());
            ps.setString(3, movie.getDirector());
            ps.setInt(4, movie.getReleaseYear());

            recordAdded = ps.executeUpdate() > 0;

            ps.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return recordAdded;
    }

    /**
     * Retrieves all movie records from the database.
     *
     * @return a list containing all movie records
     */
    public ArrayList<MovieBean> getAllMovies() {

        ArrayList<MovieBean> movies = new ArrayList<>();

        try {
            Connection conn = DBConnection.getConnection();

            String sql =
                    "SELECT * FROM noormoviesdata ORDER BY movieID";

            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                MovieBean movie = new MovieBean();

                movie.setMovieID(rs.getInt("movieID"));
                movie.setTitle(rs.getString("title"));
                movie.setGenre(rs.getString("genre"));
                movie.setDirector(rs.getString("director"));
                movie.setReleaseYear(rs.getInt("releaseYear"));

                movies.add(movie);
            }

            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return movies;
    }
}