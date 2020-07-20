using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using Npgsql;

namespace DB_TEST2
{
    class PostgresConection
    {
        public NpgsqlConnection sqlPostDB = new NpgsqlConnection("Username = postgres; Password = admin123; Host = localhost; Port = 5432; Database = Transacciones");
        DataSet data = new DataSet();
        public void Conectar()
        {
            try
            {
                sqlPostDB.Open();
                MessageBox.Show("Conecting...");
            }
            catch (Exception x)
            {

                MessageBox.Show($"{x}");
            }
        }
        public void Desconectar()
        {
            try
            {
                sqlPostDB.Close();
            }
            catch (Exception x)
            {

                MessageBox.Show($"{x}");
            }
        }
 
        public string ConsultaSaldo(ulong cuenta)
        {
            string query = $"select saldo_cuenta from usuarios where numero_cuenta = '{cuenta}'";
            NpgsqlCommand conector  = new NpgsqlCommand(query,sqlPostDB);
            NpgsqlDataAdapter datos = new NpgsqlDataAdapter(conector);
            DataTable table = new DataTable();
            datos.Fill(table);
            string dato = table.Rows[0]["saldo_cuenta"].ToString();
            return dato;

        }

        public void transaccion (ulong devitador, ulong cretidador, float valor)
        {
            this.Conectar();
            string tra_op = $"BEGIN;";
            string tra_dev = $"UPDATE usuarios SET saldo_cuenta = saldo_cuenta - {valor} Where numero_cuenta = { devitador}";
            string tra_cre = $"UPDATE usuarios SET saldo_cuenta = saldo_cuenta + {valor} Where numero_cuenta = { cretidador}";
            string tra_commit = $"COMMIT;";
            string tra_rollback = $"ROLLBACK;";

            try
            {
                NpgsqlCommand conector = new NpgsqlCommand(tra_op, sqlPostDB);
                conector.ExecuteNonQuery();
                NpgsqlCommand conector1 = new NpgsqlCommand(tra_dev, sqlPostDB);
                conector1.ExecuteNonQuery();
                NpgsqlCommand conector2 = new NpgsqlCommand(tra_cre, sqlPostDB);
                conector2.ExecuteNonQuery();
                NpgsqlCommand conector3 = new NpgsqlCommand(tra_commit, sqlPostDB);
                conector3.ExecuteNonQuery();

            }
            catch (Exception x)
            {
                NpgsqlCommand conector4 = new NpgsqlCommand(tra_rollback, sqlPostDB);
                conector4.ExecuteNonQuery();
                MessageBox.Show($"{x}");
            }

            this.Desconectar();
        }


        public void NO_transaccion (ulong devitador, ulong cretidador, float valor)
        {
            this.Conectar();
            string tra_op = $"BEGIN;";
            string tra_dev = $"UPDATE usuarios SET saldo_cuenta = saldo_cuenta - {valor} Where numero_cuenta = { devitador}";
            string tra_cre = $"UPDATE usuarios SET saldo_cuenta = saldo_cuenta + {valor} Where numero_cuenta = { cretidador}";
            string tra_commit = $"COMMIT;";
            string tra_rollback = $"ROLLBACK;";

            try
            {
                NpgsqlCommand conector = new NpgsqlCommand(tra_op, sqlPostDB);
                conector.ExecuteNonQuery();
                NpgsqlCommand conector1 = new NpgsqlCommand(tra_dev, sqlPostDB);
                conector1.ExecuteNonQuery();
                sqlPostDB.Close();
                NpgsqlCommand conector2 = new NpgsqlCommand(tra_cre, sqlPostDB);
                conector2.ExecuteNonQuery();
                NpgsqlCommand conector3 = new NpgsqlCommand(tra_commit, sqlPostDB);
                conector3.ExecuteNonQuery();

            }
            catch (Exception x)
            {
                sqlPostDB.Open();
                NpgsqlCommand conector4 = new NpgsqlCommand(tra_rollback, sqlPostDB);
                conector4.ExecuteNonQuery();
                MessageBox.Show($"{x}");
            }



            this.Desconectar();
        }

    }
}



