using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Data;
using System.Web.UI.WebControls;
using NUnit.Framework;


namespace DemoShowcase.Tests
{
    [TestFixture]
    public class FilterTests
    {
        [Test]
        public void TestFilterByGenre()
        {
            // Arrange
            var filterPage = new DemoShowcase.User.Filter();
            var ddlGenre = filterPage.FindControl("ddlGenre") as TextBox;
            ddlGenre.Text = "Action";
            var dt = new DataTable();
            // Populate `dt` with test data

            // Act
            filterPage.btnFilter_Click(null, EventArgs.Empty);

            // Assert
            Assert.AreEqual(1, filterPage.rSerial.Items.Count); // Assuming one item matches the filter
            // Additional assertions based on the expected behavior can be added
        }

        [Test]
        public void TestAddToFavorite()
        {
            // Arrange
            var filterPage = new DemoShowcase.User.Filter();
            filterPage.Session["idUser"] = 123; // Example user ID
            int serialId = 1; // Example serial ID

            // Act
            var e = new RepeaterCommandEventArgs(new RepeaterItem(-1, ListItemType.Item), null, new CommandEventArgs("AddToFavorites", serialId));
            filterPage.rSerial_ItemCommand(null, e);

            // Assert
            // Add assertions to verify the favorite item was added successfully
        }
    }
}
