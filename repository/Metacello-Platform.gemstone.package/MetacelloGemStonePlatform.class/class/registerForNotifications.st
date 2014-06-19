initialize-release
registerForNotifications
  "self registerForNotifications"

  SystemChangeNotifier uniqueInstance
    observe: ClassRemovedAnnouncement
    send: #'classRemoved:'
    to: MetacelloProjectRegistration