
##!/usr/bin/env python3
#
#name = input('Please enter you name ....\n')
#print('Hello', name)
#
#print('I\'m a girl')
#print(r'line1\nline2\nline3')
#
#print('''line1
#... line2
#... line3''')
#
#print(not (3 > 6 or 3 > 5))
#print(None)

#!/usr/bin/env python3
# -*- coding: utf-8 -*-


#from tkinter import *
#import tkinter.messagebox as messagebox
#
#class Application(Frame):
#
#  def __init__(self, master=None):
#    Frame.__init__(self, master)
#    self.pack()
#    self.createWidgets()
#
#  def createWidgets(self):
#    self.nameInput = Entry(self)
#    self.nameInput.pack()
#    self.alertButton = Button(self, text='Click', command=self.helloAction)
#    self.alertButton.pack()
#
#  def helloAction(self):
#    name = self.nameInput.get() or 'world'
#    messagebox.showinfo('Message', 'Hello, %s' % name)
#
#app = Application()
## 设置窗口标题:
#app.master.title('Hello World')
## 主消息循环:
#app.mainloop()


# wxWidgets "Hello World" Program
# For compilers that support precompilation, includes "wx/wx.h".
include <wx/wxprec.h>
ifndef WX_PRECOMP
include <wx/wx.h>
#endif
class MyApp : public wxApp
{
public:
  virtual bool OnInit();
};
class MyFrame : public wxFrame
{
public:
  MyFrame();
private:
  void OnHello(wxCommandEvent& event);
  void OnExit(wxCommandEvent& event);
  void OnAbout(wxCommandEvent& event);
};
enum
{
  ID_Hello = 1
};
wxIMPLEMENT_APP(MyApp);
bool MyApp::OnInit()
{
  MyFrame *frame = new MyFrame();
  frame->Show(true);
  return true;
}
MyFrame::MyFrame()
  : wxFrame(NULL, wxID_ANY, "Hello World")
{
  wxMenu *menuFile = new wxMenu;
    menuFile->Append(ID_Hello, "&Hello...\tCtrl-H",
                     "Help string shown in status bar for this menu item");
                     menuFile->AppendSeparator();
                     menuFile->Append(wxID_EXIT);
                     wxMenu *menuHelp = new wxMenu;
                     menuHelp->Append(wxID_ABOUT);
                     wxMenuBar *menuBar = new wxMenuBar;
                     menuBar->Append(menuFile, "&File");
                     menuBar->Append(menuHelp, "&Help");
                     SetMenuBar( menuBar );
                     CreateStatusBar();
                     SetStatusText("Welcome to wxWidgets!");
                     Bind(wxEVT_MENU, &MyFrame::OnHello, this, ID_Hello);
                     Bind(wxEVT_MENU, &MyFrame::OnAbout, this, wxID_ABOUT);
                     Bind(wxEVT_MENU, &MyFrame::OnExit, this, wxID_EXIT);
}
void MyFrame::OnExit(wxCommandEvent& event)
{
  Close(true);
}
void MyFrame::OnAbout(wxCommandEvent& event)
{
  wxMessageBox("This is a wxWidgets Hello World example",
               "About Hello World", wxOK | wxICON_INFORMATION);
}
void MyFrame::OnHello(wxCommandEvent& event)
{
  wxLogMessage("Hello world from wxWidgets!");
}
