﻿namespace ClientSide
{
    partial class clientSideForm
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
            this.SendBtn = new System.Windows.Forms.Button();
            this.messageTxtBox = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.keyTextBox = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // SendBtn
            // 
            this.SendBtn.Location = new System.Drawing.Point(565, 356);
            this.SendBtn.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.SendBtn.Name = "SendBtn";
            this.SendBtn.Size = new System.Drawing.Size(85, 36);
            this.SendBtn.TabIndex = 0;
            this.SendBtn.Text = "Send";
            this.SendBtn.UseVisualStyleBackColor = true;
            this.SendBtn.Click += new System.EventHandler(this.SendBtn_Click);
            // 
            // messageTxtBox
            // 
            this.messageTxtBox.Location = new System.Drawing.Point(133, 34);
            this.messageTxtBox.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.messageTxtBox.Multiline = true;
            this.messageTxtBox.Name = "messageTxtBox";
            this.messageTxtBox.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.messageTxtBox.Size = new System.Drawing.Size(529, 150);
            this.messageTxtBox.TabIndex = 1;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(25, 103);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(90, 20);
            this.label1.TabIndex = 2;
            this.label1.Text = "Message:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(25, 270);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(46, 20);
            this.label2.TabIndex = 4;
            this.label2.Text = "Key:";
            // 
            // keyTextBox
            // 
            this.keyTextBox.Location = new System.Drawing.Point(133, 199);
            this.keyTextBox.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.keyTextBox.Multiline = true;
            this.keyTextBox.Name = "keyTextBox";
            this.keyTextBox.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.keyTextBox.Size = new System.Drawing.Size(529, 150);
            this.keyTextBox.TabIndex = 3;
            // 
            // clientSideForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(675, 404);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.keyTextBox);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.messageTxtBox);
            this.Controls.Add(this.SendBtn);
            this.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.Name = "clientSideForm";
            this.Text = "Client-Side";
            this.Load += new System.EventHandler(this.clientSideForm_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button SendBtn;
        private System.Windows.Forms.TextBox messageTxtBox;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox keyTextBox;
    }
}

