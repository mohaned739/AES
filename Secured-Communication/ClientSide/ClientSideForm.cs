using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
namespace ClientSide
{
    public partial class clientSideForm : Form
    {
        IPEndPoint serverIP;
        Socket clientSocket;
        public clientSideForm()
        {
            InitializeComponent();
        }
        public void IntializeIPEndPoint()
        {
            this.serverIP = new IPEndPoint(IPAddress.Parse("127.0.0.1"), 8015);
        }
        public void IntializeClientSocket()
        {
            clientSocket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
            clientSocket.Connect(serverIP);
        }

        public void SendMessage(byte[] encryptedMessage)
        {
            clientSocket.Send(encryptedMessage);
        }

        public static byte[] StringToByteArray(string hex)
        {
            return Enumerable.Range(0, hex.Length)
                             .Where(x => x % 2 == 0)
                             .Select(x => Convert.ToByte(hex.Substring(x, 2), 16))
                             .ToArray();
        }
        // text =328831e0435a3137f6309807a88da234
        // key = 2b28ab097eaef7cf15d2154f16a6883c
        // decrypted = 3902dc1925dc116a8409850b1dfb9732
        // dec_key = d0c9e1b614ee3f63f9250c0ca889c8a6
        /// <summary>
        /// Encrypt the string using Assembly DLL
        /// </summary>
        /// <param name="message"></param>
        /// <returns></returns>
        public byte[] EncryptMessage(string message, string key)
        {
            int len=message.Length;
            int len2 = key.Length;
            byte[] text = StringToByteArray(message);
            byte[] Key = StringToByteArray(key);
            ASMDLL.Encrypt(text, Key, 16);
            byte[] trueOut = StringToByteArray("69c4e0d86a7b0430d8cdb78070b4c55a");
            MessageBox.Show("" + text.SequenceEqual(trueOut));
            return text;
        }
        private void SendBtn_Click(object sender, EventArgs e)
        {
            this.IntializeIPEndPoint();
            this.IntializeClientSocket();
            string key = keyTextBox.Text;
            byte[] encryptedMessage = this.EncryptMessage(messageTxtBox.Text, key);
            this.clientSocket.Send(encryptedMessage.Concat(StringToByteArray(key)).ToArray());
            this.CloseClientSocket();
        }

        public void CloseClientSocket()
        {
            this.clientSocket.Close();
        }

        private void clientSideForm_Load(object sender, EventArgs e)
        {

        }
    }
}
