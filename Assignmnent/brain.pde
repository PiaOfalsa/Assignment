
class BRAIN
{
  String Neurotransmitter;
  String cerebellum;
  int year;
  float brainwaves;

  BRAIN(String line)
  {
    String[] fields = line.split(",");
    Neurotransmitter = fields[0];
    cerebellum = fields[1];
    year = Integer.parseInt(fields[3]);
    brainwaves = Float.parseFloat(fields[4]);
  }

  BRAIN(TableRow row)
  {
    Neurotransmitter = row.getString(0);
    cerebellum = row.getString(1);
    year = row.getInt(2);
    brainwaves = row.getFloat(3);
  }
}