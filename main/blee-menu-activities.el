;;;
;;;

(require 'easymenu)
(require 'blee-nested-menus)

;;;
;;; Global Activities Menu
;;;


;; (blee:activities:menu)
(defun blee:activities:menu ()
  (easy-menu-define 
    activities-menu-global
    global-map 
    "Activities (Panels and ActiveDocs) Menu"
    '("Panels"
      ["Libre-Halaal ByStar Digital Ecosystem -- Top Actives Panel" bx:bnsm:top:panel-listOfDocs t]
      ;;;["Blee Top Activities Panel" bx:bnsm:top:panel-blee t]
      "---"
      ;;; F11 a x
      ["Agenda, Calendar and Time/Projects Management" blee:activities:agendaManagement t]
      ;;; ["Calendar / Diary / Events / Appointment" (blee:bnsm:panel-goto "/libre/ByStar/InitialTemplates/activeDocs/blee/calendarEvents") t]
      ;;; F11 b x, or F4 x
      ["Contacts -- Address Book -- BBDB [By*+User]"  blee:activities:contacts t]
      ;;; F3 x
      ["Mail Origination" blee:activities:mailCompose t]
      ["Mail Reading (Retrieval, Processing, Search)" blee:activities:mailRead t]
      ;;;; F11 i x
      ["Information Sources / Bookmarks" (blee:bnsm:panel-goto "/libre/ByStar/InitialTemplates/activeDocs/blee/bookmarks") t]
      ;;;  F11 m x
      ["Music / Multimedia" (blee:bnsm:panel-goto "/libre/ByStar/InitialTemplates/activeDocs/blee/multimedia") t]
      ;;;["Platform and BASA and Management" (blee:bnsm:panel-goto "/libre/ByStar/InitialTemplates/activeDocs/blee/autonomousAccount") t]
      ;;; F11 p x
      ["Content Generation and Self Publication (lcnt)" (blee:bnsm:panel-goto "/libre/ByStar/InitialTemplates/activeDocs/blee/lcntPublications") t]
      ["Content Disposition and ScreenCasting" (blee:bnsm:panel-goto "/libre/ByStar/InitialTemplates/activeDocs/blee/screencasting") t]
      ;;; F11 s x
      ["Synchronization -- Software Updates -- Virtualization" (blee:bnsm:panel-goto "/libre/ByStar/InitialTemplates/activeDocs/blee/syncUpdate/") t] 
      "---"
      ["By*Entity/By*ServiceObjects and Services Admin (BASA/BxISo)" (blee:bnsm:panel-goto "/libre/ByStar/InitialTemplates/activeDocs/bxServices/basaManage") t]
      ["By*User Env (BUE) Setup -- BxU<-->BxAUe Association" (blee:bnsm:panel-goto "/libre/ByStar/InitialTemplates/activeDocs/bxUser") t]
      ["By* Service Realization Modes Management" (blee:bnsm:panel-goto "/libre/ByStar/InitialTemplates/activeDocs/bxServices/bxsrModes") t]
      ["By* Software-Service Contiuum Realization" (blee:bnsm:panel-goto "/libre/ByStar/InitialTemplates/activeDocs/blee/bystarContinuum") t]
      ["BISOS Platform Facilities Development and Admin" (blee:bnsm:panel-goto "/libre/ByStar/InitialTemplates/activeDocs/bisos/main") t]      
      ;;; ["By* Service Capabilities (BxSc) Management (BACS)" (blee:bnsm:panel-goto "/libre/ByStar/InitialTemplates/activeDocs/bxServices/servicesManage") t]
      "---"
      ["ByStar Reference Model and Terminology -- BxIso Transition" (blee:bnsm:panel-goto "/libre/ByStar/InitialTemplates/activeDocs/bxRefModel") t]
      "---"
      ["ByStar Human And Machine Languages And Standards" (blee:bnsm:panel-goto "/libre/ByStar/InitialTemplates/activeDocs/bxLanguages") t]
      "---"
      ["BUE: Blee Emacs Activities (By* Emacs)" (blee:bnsm:panel-goto "/libre/ByStar/InitialTemplates/activeDocs/blee/bleeActivities") t]
      ;;;["BUE: Blee Emacs Features (By* Emacs Minor Modes)" (blee:bnsm:panel-goto "/libre/ByStar/InitialTemplates/activeDocs/blee/bleeFeatures") t]
      ["BUE: Firefox Browser Features (Extensions and Customizations)" (blee:bnsm:panel-goto "/libre/ByStar/InitialTemplates/activeDocs/blee/bleeBrowsers") t]      
      ;;; F11 g x
      ["BUE: Gnome Desktop Applications (Gnome Apps)" (blee:bnsm:panel-goto "/libre/ByStar/InitialTemplates/activeDocs/blee/globalFacilities") t]
      "---"
      ["ByStar Platform (BxP) Settings and Admin [By*+Collective+User]" (blee:bnsm:panel-goto "/libre/ByStar/InitialTemplates/activeDocs/blee/deviceAndUser") t]
      ["Platform Connectivity (L2, L3, VPN, Dns)" (blee:bnsm:panel-goto "/libre/ByStar/InitialTemplates/activeDocs/blee/platformConnectivity") t]
      ["BxP Peripherals (Print, Scan, Fax, Camera)" (blee:bnsm:panel-goto "/libre/ByStar/InitialTemplates/activeDocs/blee/peripherals") t]            
      "---"
      ["ByStar Central" (blee:bnsm:panel-goto "/libre/ByStar/InitialTemplates/activeDocs/bxServices/bxCentral") t]
      ["BxDE Documents, Information And Development Plans" (blee:bnsm:panel-goto "/libre/ByStar/InitialTemplates/activeDocs/bxDE/main") t]      
      ;; "---"
      ;; ("Blee and By* Documents and Information"
      ;;  ["Blee:  Model, Usage Procedures, Policies" (blee:bnsm:doc-goto  "/libre/ByStar/InitialTemplates/activeDocs/blee") t]
      ;;  ["Blee Stable Developement" (blee:bnsm:panel-goto "/libre/ByStar/InitialTemplates/activeDocs/bleeDev") t]
      ;;  ["Blee Unstable Development" (blee:bnsm:panel-goto  "/libre/ByStar/InitialTemplates/activeDocs/bleeUnstable") t]
      ;;  )
      ;; ;;; "---"
      ;; ;;; ["User Activities, Projects and Information -- Private" (blee:bnsm:panel-goto "/acct/employee/lsipusr/BUE/activeDocs/curProjs") t]
      ;; ;;; ["User Specific Information and Activities" (blee:bnsm:panel-goto "/acct/employee/lsipusr/BUE/activeDocs/blee") t]
      ;; ;;;["Extensions / Site+User Addintional Features" (blee:bnsm:panel-goto "/libre/ByStar/InitialTemplates/activeDocs/blee/myFeatures") t]
      ;; ;;;"---"
      ;; ;;;["Site Activities, Projects and Information -- Private" (blee:bnsm:panel-goto "/private/site/activeDocs/bxSite") t]
      ;; "---"
      ;; ("Blee and By* Development (Tasks)"
      ;;  ["By* User Environment Applications" (blee:bnsm:panel-goto "/libre/ByStar/InitialTemplates/activeDocs/blee/bxApps") t]
      ;;  ["By* Services Stable Development" (blee:bnsm:panel-goto "/libre/ByStar/InitialTemplates/activeDocs/bxServicesDev") t]
      ;;  ["By* Services Unstable Development" (blee:bnsm:panel-goto "/libre/ByStar/InitialTemplates/activeDocs/bxServicesUnstable") t]
      ;;  )

      ))
  )


;; 
(defun activities-menu-help ()
  (interactive)
  (message "activities-menu-help NOTYET")
  )

(provide 'blee-menu-activities)


