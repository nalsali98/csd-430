package edu.bellevue.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Performs database operations for movie records stored
 * in the noormoviesdata table.
 *
 * This DAO supports the CREATE, READ, UPDATE, and DELETE
 * operations required for the CSD430 project.
 *
 * @author Noor El-din Al salihi
 * @version 2.0
 */
public class MovieDAO {

    /**
     * Retrieves all movie IDs from the database.
     * The IDs are used in the HTML select dropdown menus.
     *
     * @return a list containing every movie ID
     */
    public ArrayList<Integer> getMovieIDs() {

        ArrayList<Integer> movieIDs = new ArrayList<>();

        String sql =
                "SELECT movieID " +
                        "FROM noormoviesdata " +
                        "ORDER BY movieID";

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement statement =
                        connection.prepareStatement(sql);

                ResultSet resultSet =
                        statement.executeQuery()
        ) {

            while (resultSet.next()) {

                movieIDs.add(
                        resultSet.getInt("movieID")
                );
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return movieIDs;
    }

    /**
     * Retrieves one movie record using its primary key.
     *
     * @param movieID primary key of the requested movie
     * @return the matching MovieBean, or null when no record is found
     */
    public MovieBean getMovieByID(int movieID) {

        MovieBean movie = null;

        String sql =
                "SELECT movieID, title, genre, director, releaseYear " +
                        "FROM noormoviesdata " +
                        "WHERE movieID = ?";

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setInt(1, movieID);

            try (
                    ResultSet resultSet =
                            statement.executeQuery()
            ) {

                if (resultSet.next()) {

                    movie = new MovieBean();

                    movie.setMovieID(
                            resultSet.getInt("movieID")
                    );

                    movie.setTitle(
                            resultSet.getString("title")
                    );

                    movie.setGenre(
                            resultSet.getString("genre")
                    );

                    movie.setDirector(
                            resultSet.getString("director")
                    );

                    movie.setReleaseYear(
                            resultSet.getInt("releaseYear")
                    );
                }
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return movie;
    }

    /**
     * Adds a new movie record to the database.
     *
     * @param movie MovieBean containing the new movie information
     * @return true when the record is inserted successfully
     */
    public boolean addMovie(MovieBean movie) {

        String sql =
                "INSERT INTO noormoviesdata " +
                        "(title, genre, director, releaseYear) " +
                        "VALUES (?, ?, ?, ?)";

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setString(
                    1,
                    movie.getTitle()
            );

            statement.setString(
                    2,
                    movie.getGenre()
            );

            statement.setString(
                    3,
                    movie.getDirector()
            );

            statement.setInt(
                    4,
                    movie.getReleaseYear()
            );

            return statement.executeUpdate() > 0;

        } catch (SQLException e) {

            e.printStackTrace();
            return false;
        }
    }

    /**
     * Updates an existing movie record.
     *
     * @param movie MovieBean containing the updated information
     * @return true when the record is updated successfully
     */
    public boolean updateMovie(MovieBean movie) {

        String sql =
                "UPDATE noormoviesdata " +
                        "SET title = ?, " +
                        "genre = ?, " +
                        "director = ?, " +
                        "releaseYear = ? " +
                        "WHERE movieID = ?";

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setString(
                    1,
                    movie.getTitle()
            );

            statement.setString(
                    2,
                    movie.getGenre()
            );

            statement.setString(
                    3,
                    movie.getDirector()
            );

            statement.setInt(
                    4,
                    movie.getReleaseYear()
            );

            statement.setInt(
                    5,
                    movie.getMovieID()
            );

            return statement.executeUpdate() > 0;

        } catch (SQLException e) {

            e.printStackTrace();
            return false;
        }
    }

    /**
     * Retrieves every movie record stored in the database.
     *
     * The records are returned in primary-key order and
     * displayed in the Module 9 HTML table.
     *
     * @return a list containing all movie records
     */
    public ArrayList<MovieBean> getAllMovies() {

        ArrayList<MovieBean> movies =
                new ArrayList<>();

        String sql =
                "SELECT movieID, title, genre, director, releaseYear " +
                        "FROM noormoviesdata " +
                        "ORDER BY movieID";

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement statement =
                        connection.prepareStatement(sql);

                ResultSet resultSet =
                        statement.executeQuery()
        ) {

            while (resultSet.next()) {

                MovieBean movie =
                        new MovieBean();

                movie.setMovieID(
                        resultSet.getInt("movieID")
                );

                movie.setTitle(
                        resultSet.getString("title")
                );

                movie.setGenre(
                        resultSet.getString("genre")
                );

                movie.setDirector(
                        resultSet.getString("director")
                );

                movie.setReleaseYear(
                        resultSet.getInt("releaseYear")
                );

                movies.add(movie);
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return movies;
    }

    /**
     * Deletes one movie record using its primary key.
     *
     * A PreparedStatement is used to safely place the
     * selected movie ID into the DELETE statement.
     *
     * @param movieID primary key of the movie to delete
     * @return true when one or more records are deleted
     */
    public boolean deleteMovie(int movieID) {

        String sql =
                "DELETE FROM noormoviesdata " +
                        "WHERE movieID = ?";

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setInt(
                    1,
                    movieID
            );

            return statement.executeUpdate() > 0;

        } catch (SQLException e) {

            e.printStackTrace();
            return false;
        }
    }
}