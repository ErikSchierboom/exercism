using System;
using System.Collections.Generic;
using System.Linq;

public static class BookStore
{
    private const double BookPrice = 8.0;

    public static double CalculateTotalCost(List<int> books)
    {
        if (!books.Any())
            return 0.0;

        var bookGroups = BookGroupsWithCount(books);

        return Enumerable.Range(1, bookGroups.Count)
            .Min(size => CalculateTotalCost(bookGroups, size, 0.0));
    }

    private static List<int> BookGroupsWithCount(List<int> books)
    {
        return books
            .GroupBy(x => x)
            .Select(x => x.Count())
            .OrderByDescending(x => x)
            .ToList();
    }

    private static double CalculateTotalCost(List<int> bookGroups, int numberOfBooksToRemove, double totalCost)
    {
        var numberOfBooks = Math.Min(numberOfBooksToRemove, bookGroups.Count);

        if (numberOfBooks == 0)
        {
            totalCost += RegularPrice(bookGroups.Sum());
            return totalCost;
        }            

        totalCost += BooksPrice(numberOfBooks);
        var updatedBookGroups = RemoveBooks(bookGroups, numberOfBooks);

        return CalculateTotalCost(updatedBookGroups, numberOfBooks, totalCost);
    }

    private static List<int> RemoveBooks(List<int> bookGroups, int numberOfBooks)
    {
        return bookGroups
            .Take(numberOfBooks)
            .Select(RemoveBook)
            .Concat(bookGroups.Skip(numberOfBooks))
            .Where(i => i > 0)
            .OrderByDescending(x => x)
            .ToList();
    }

    private static int RemoveBook(int books) => books - 1;

    private static double BooksPrice(int differentBooks) =>
        ApplyDiscount(RegularPrice(differentBooks), DiscountPercentage(differentBooks));

    private static double RegularPrice(int books) => books * BookPrice;

    private static double DiscountPercentage(int differentBooks)
    {
        switch (differentBooks)
        {
            case 5: return 25.0;
            case 4: return 20.0;
            case 3: return 10.0;
            case 2: return 5.0;
            default: return 0.0;
        }
    }

    private static double ApplyDiscount(double price, double discountPercentage) => 
        Math.Round(price * (100.0f - discountPercentage) / 100.0f, 2);
}