package edu.bellevue.beans;

import java.io.Serializable;

/**
 * JavaBean representing one movie record from the
 * noormoviesdata database table.
 *
 * @author Noor El-din Al salihi
 * @version 1.0
 */
public class MovieBean implements Serializable {

    private static final long serialVersionUID = 1L;

    private int movieID;
    private String title;
    private String genre;
    private String director;
    private int releaseYear;

    /**
     * No-argument constructor required for a JavaBean.
     */
    public MovieBean() {
    }

    /**
     * Returns the movie ID.
     *
     * @return movie ID
     */
    public int getMovieID() {
        return movieID;
    }

    /**
     * Sets the movie ID.
     *
     * @param movieID movie ID
     */
    public void setMovieID(int movieID) {
        this.movieID = movieID;
    }

    /**
     * Returns the movie title.
     *
     * @return movie title
     */
    public String getTitle() {
        return title;
    }

    /**
     * Sets the movie title.
     *
     * @param title movie title
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * Returns the movie genre.
     *
     * @return movie genre
     */
    public String getGenre() {
        return genre;
    }

    /**
     * Sets the movie genre.
     *
     * @param genre movie genre
     */
    public void setGenre(String genre) {
        this.genre = genre;
    }

    /**
     * Returns the movie director.
     *
     * @return movie director
     */
    public String getDirector() {
        return director;
    }

    /**
     * Sets the movie director.
     *
     * @param director movie director
     */
    public void setDirector(String director) {
        this.director = director;
    }

    /**
     * Returns the release year.
     *
     * @return movie release year
     */
    public int getReleaseYear() {
        return releaseYear;
    }

    /**
     * Sets the release year.
     *
     * @param releaseYear movie release year
     */
    public void setReleaseYear(int releaseYear) {
        this.releaseYear = releaseYear;
    }
}