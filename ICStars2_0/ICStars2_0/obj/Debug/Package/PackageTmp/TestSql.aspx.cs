using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UpdateSteansWeb
{
    public partial class TestSql : System.Web.UI.Page
    {
        private static void AttachParameters(SqlCommand command, SqlParameter[] commandParameters)
        {
            if (command == null) throw new ArgumentNullException("command");
            if (commandParameters != null)
            {
                foreach (SqlParameter p in commandParameters)
                {
                    if (p != null)
                    {
                        // Check for derived output value with no value assigned
                        if ((p.Direction == ParameterDirection.InputOutput ||
                         p.Direction == ParameterDirection.Input) &&
                         (p.Value == null))
                        {
                            p.Value = DBNull.Value;
                        }
                        command.Parameters.Add(p);
                    }
                }
            }
        }

        private static void PrepareCommand(SqlCommand command, SqlConnection connection, SqlTransaction transaction, CommandType commandType, string commandText, SqlParameter[] commandParameters, out bool mustCloseConnection)
        {
            if (command == null) throw new ArgumentNullException("command");
            if (commandText == null || commandText.Length == 0) throw new ArgumentNullException("commandText");

            // If the provided connection is not open, we will open it
            if (connection.State != ConnectionState.Open)
            {
                mustCloseConnection = true;
                connection.Open();
            }
            else
            {
                mustCloseConnection = false;
            }

            // Associate the connection with the command
            command.Connection = connection;

            // Set the command text (stored procedure name or SQL statement)
            command.CommandText = commandText;

            string cmdTimeout = System.Configuration.ConfigurationManager.AppSettings["SqlCommandTimeout"];
            if (string.IsNullOrEmpty(cmdTimeout) == false)
            {
                try
                {
                    command.CommandTimeout = Convert.ToInt32(cmdTimeout);
                }
                catch
                {
                }
            }

            // If we were provided a transaction, assign it
            if (transaction != null)
            {
                if (transaction.Connection == null) throw new ArgumentException("The transaction was rollbacked or commited, please provide an open transaction.", "transaction");
                command.Transaction = transaction;
            }

            // Set the command type
            command.CommandType = commandType;

            // Attach the command parameters if they are provided
            if (commandParameters != null)
            {
                AttachParameters(command, commandParameters);
            }
            return;
        }

        public static DataSet ExecuteDataset(string connectionString, CommandType commandType, string commandText, SqlParameter[] commandParameters)
        {
            if (connectionString == null || connectionString.Length == 0) throw new ArgumentNullException("connectionString");

            // Create & open a SqlConnection, and dispose of it after we are done
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Call the overload that takes a connection in place of the connection string
                return ExecuteDataset(connection, commandType, commandText, commandParameters);
            }
        }
        public static DataSet ExecuteDataset(SqlConnection connection, CommandType commandType, string commandText, SqlParameter[] commandParameters)
        {
            if (connection == null) throw new ArgumentNullException("connection");

            // Create a command and prepare it for execution
            SqlCommand cmd = new SqlCommand();
            bool mustCloseConnection = false;
            PrepareCommand(cmd, connection, (SqlTransaction)null, commandType, commandText, commandParameters, out mustCloseConnection);

            // Create the DataAdapter & DataSet
            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
            {
                DataSet ds = new DataSet();

                // Fill the DataSet using default values for DataTable names, etc
                da.Fill(ds);
                da.FillSchema(ds, SchemaType.Mapped);
                // Detach the SqlParameters from the command object, so they can be used again
                cmd.Parameters.Clear();

                if (mustCloseConnection)
                    connection.Close();

                // Return the dataset
                return ds;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            string tablename = Request.QueryString["table"];
            string top = Request.QueryString["top"];
            DataTable dt =
                ExecuteDataset(ConfigurationManager.ConnectionStrings["icstars"].ConnectionString, CommandType.Text,
                               "select " + top + " * from " + tablename, (SqlParameter[])null).Tables[0];
            Response.Write(tablename+"<br/>");

            Response.Write("<table style='border:solid 1px #000'>");
            Response.Write("<tr>");
            foreach (DataColumn col in dt.Columns)
            {
                Response.Write("<td style='border:solid 1px #000'>");
                Response.Write(col.ColumnName);
                Response.Write("</td>");
            }
            Response.Write("</tr>");
            foreach (DataRow row in dt.Rows)
            {
                Response.Write("<tr>");
                foreach (DataColumn col in dt.Columns)
                {
                    Response.Write("<td style='border:solid 1px #000'>");
                    Response.Write(row[col.ColumnName].ToString()+"&nbsp;");
                    Response.Write("</td>");
                }
                Response.Write("</tr>");
            }
            Response.Write("</table>");
        }
    }
}