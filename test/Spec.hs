import Test.Hspec
import qualified Data.Time.Calendar.BankHoliday.UnitedStatesSpec as UnitedStates
import qualified Data.Time.Calendar.BankHolidaySpec as BankHoliday

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  UnitedStates.spec
  BankHoliday.spec

