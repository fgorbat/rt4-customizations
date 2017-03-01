### GLOBAL  FUNCTIONS ###

#-#-# Print to the log file only
PRINT_LOG() 
{
 #[ ! -f $LOGFILE ] && /bin/touch $LOGFILE
 [ ! -f $LOGFILE ] && > $LOGFILE
 /bin/echo -en "[$(date +%d"/"%b"/"%G"-"%T)] $1" >> $LOGFILE
}


#-#-# Print to tty only
PRINT_SCREEN()
{
 ## Message to print
 local message=$1 
 case "$2" in
     "nopoints") /bin/echo -en "[$(date +%d"/"%b"/"%G"-"%T)] ${message}"
                 ;;
              *) /bin/echo -en "[$(date +%d"/"%b"/"%G"-"%T)] ${message}..."
                 ;;
 esac
}


#-#-# Print to tty and logfile
PRINT_LOG_SCREEN()
{
 ## Message to print
 local message=$1
 [[ ! -f $LOGFILE ]] && /bin/touch $LOGFILE
 case "$2" in 
      "nopoints") /bin/echo -en "[$(date +%d"/"%b"/"%G"-"%T)] ${message}"
                  ;;
               *) /bin/echo -en "[$(date +%d"/"%b"/"%G"-"%T)] ${message}..."
                  ;;
 esac
 /bin/echo -en "[$(date +%d"/"%b"/"%G"-"%T)] ${message}" >> $LOGFILE
}
 

#-#-# Success message
SUCCESS()
{
 [[ ! -f $LOGFILE ]] && /bin/touch $LOGFILE
 $SUCCESS_COLOR;/bin/echo -n "OK" ;$NORMAL_COLOR;/bin/echo
 /bin/echo -en " => [Ok]\n" >> $LOGFILE
}


#-#-# Warning message
WARNING()
{
 [[ ! -f $LOGFILE ]] && /bin/touch $LOGFILE
 $WARNING_COLOR; /bin/echo -n "Warning" ; $NORMAL_COLOR; /bin/echo
 /bin/echo -en " => [Warning]\n" >> $LOGFILE
}


#-#-# Failure message
FAILURE()
{
 [[ ! -f $LOGFILE ]] && /bin/touch $LOGFILE
 $FAILURE_COLOR; /bin/echo -n "Failed" ;$NORMAL_COLOR; /bin/echo
 /bin/echo -en " => [Failed]\n" >> $LOGFILE
}


#-#-# Checking the status of the executed command
FAILURE_SUCCESS()
{
 local message=$1     ## Message to print
 local return_code=$2 ## Return code 
 if (( ${return_code} )); then
     FAILURE
     PRINT_LOG "$message"
     PRINT_SCREEN "$message\n" 'nopoints'
     exit 1
 fi
 SUCCESS
}
