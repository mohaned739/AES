namespace ServerSide
{
    partial class ServerSideForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.msgLBL = new System.Windows.Forms.Label();
            this.btnStartServer = new System.Windows.Forms.Button();
            this.messageTextBox = new System.Windows.Forms.TextBox();
            this.button1 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // msgLBL
            // 
            this.msgLBL.AutoSize = true;
            this.msgLBL.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.msgLBL.Location = new System.Drawing.Point(12, 92);
            this.msgLBL.Name = "msgLBL";
            this.msgLBL.Size = new System.Drawing.Size(179, 20);
            this.msgLBL.TabIndex = 0;
            this.msgLBL.Text = "Received Message: ";
            // 
            // btnStartServer
            // 
            this.btnStartServer.Location = new System.Drawing.Point(487, 210);
            this.btnStartServer.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnStartServer.Name = "btnStartServer";
            this.btnStartServer.Size = new System.Drawing.Size(75, 28);
            this.btnStartServer.TabIndex = 1;
            this.btnStartServer.Text = "Start Server";
            this.btnStartServer.UseVisualStyleBackColor = true;
            this.btnStartServer.Click += new System.EventHandler(this.btnStartServer_Click);
            // 
            // messageTextBox
            // 
            this.messageTextBox.Enabled = false;
            this.messageTextBox.Location = new System.Drawing.Point(197, 12);
            this.messageTextBox.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.messageTextBox.Multiline = true;
            this.messageTextBox.Name = "messageTextBox";
            this.messageTextBox.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.messageTextBox.Size = new System.Drawing.Size(365, 169);
            this.messageTextBox.TabIndex = 2;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(296, 210);
            this.button1.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(184, 28);
            this.button1.TabIndex = 3;
            this.button1.Text = "show encrypted";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(185, 210);
            this.button2.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(100, 28);
            this.button2.TabIndex = 4;
            this.button2.Text = "decrypt";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // ServerSideForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(589, 250);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.messageTextBox);
            this.Controls.Add(this.btnStartServer);
            this.Controls.Add(this.msgLBL);
            this.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.Name = "ServerSideForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Server Side Form";
            this.Load += new System.EventHandler(this.ServerSideForm_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label msgLBL;
        private System.Windows.Forms.Button btnStartServer;
        private System.Windows.Forms.TextBox messageTextBox;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button button2;
    }
}

