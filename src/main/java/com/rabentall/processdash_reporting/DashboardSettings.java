package com.rabentall.processdash_reporting;

import java.util.Properties;
import net.sourceforge.processdash.api.PDashContext;
import net.sourceforge.processdash.Settings;

public class DashboardSettings extends DashData
{
  Properties dashboardSettings = Settings.getSettings();

  @Override
  void load(PDashContext ctx) {
  }  
}
