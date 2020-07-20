using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using Npgsql;

namespace DB_TEST2
{
    /// <summary>
    /// Lógica de interacción para MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        PostgresConection postgresC = new PostgresConection();
        public MainWindow()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)                    //transaccion sin error
        {
            postgresC.transaccion(Convert.ToUInt64(txbx_Saldo1.Text), Convert.ToUInt64(txbx_Saldo2.Text), Convert.ToSingle(txbx_valor.Text));

        }

        private void Button_Click_1(object sender, RoutedEventArgs e)                    //transaccion con error
        {
            postgresC.NO_transaccion(Convert.ToUInt64(txbx_Saldo1.Text), Convert.ToUInt64(txbx_Saldo2.Text), Convert.ToSingle(txbx_valor.Text));
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)                   /// ATUALIZA datos en pantall 
        {
           try
            {
                postgresC.Desconectar();
                postgresC.Conectar();
                
                Label_saldo1.Content = postgresC.ConsultaSaldo(Convert.ToUInt64(txbx_Saldo1.Text));
                Label_saldo2.Content = postgresC.ConsultaSaldo(Convert.ToUInt64(txbx_Saldo2.Text));
                postgresC.Desconectar();

            }
            catch (Exception x)
            {
                MessageBox.Show($"{x}");
            }
            
        }



        private void TextBox_TextChanged(object sender, TextChangedEventArgs e)
        {

        }

        private void DataGrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        private void Button_Click_3(object sender, RoutedEventArgs e)
        {

        }
    }
}
