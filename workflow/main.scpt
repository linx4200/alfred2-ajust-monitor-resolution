# get the workflow's source folder
set workflowFolder to do shell script "pwd"

# load the Workflow library
set wlib to load script POSIX file (workflowFolder & "/q_workflow.scpt")

# create a new Workflow Class
set wf to wlib's new_workflow()

tell application "System Preferences"
  reveal anchor "displaysDisplayTab" of pane "com.apple.preference.displays"
end tell
tell application "System Events" to tell process "System Preferences"
  tell tab group 1 of window 1
    click radio button "显示器"
    set btns to entire contents of radio group 1
    repeat with value in btns
      log string value
    end repeat
  end tell
end tell