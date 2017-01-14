component output="false" displayname=""  {

	public function isLeapYear(year) {
		if(year % 400 == 0) {
			return true;
		} else if(year % 4 == 0 AND year % 100 != 0) {
			return true;
		}
		return false;
	}
}