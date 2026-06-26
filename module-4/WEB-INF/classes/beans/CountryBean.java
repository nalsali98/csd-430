package beans;

import java.io.Serializable;

/*
 * Name: Noor El-din Al salihi
 * Date: June 25, 2026
 * Assignment: Module 4.2 Programming Assignment
 * Purpose: JavaBean used to store country information.
 */

public class CountryBean implements Serializable {

    private String countryName;
    private String capital;
    private String language;
    private String famousFood;
    private String attraction;

    public CountryBean(String countryName, String capital,
                       String language, String famousFood,
                       String attraction) {

        this.countryName = countryName;
        this.capital = capital;
        this.language = language;
        this.famousFood = famousFood;
        this.attraction = attraction;
    }

    public String getCountryName() {
        return countryName;
    }

    public String getCapital() {
        return capital;
    }

    public String getLanguage() {
        return language;
    }

    public String getFamousFood() {
        return famousFood;
    }

    public String getAttraction() {
        return attraction;
    }
}