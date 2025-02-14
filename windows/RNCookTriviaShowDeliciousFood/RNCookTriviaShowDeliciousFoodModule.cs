using ReactNative.Bridge;
using System;
using System.Collections.Generic;
using Windows.ApplicationModel.Core;
using Windows.UI.Core;

namespace Cook.Trivia.Show.Delicious.Food.RNCookTriviaShowDeliciousFood
{
    /// <summary>
    /// A module that allows JS to share data.
    /// </summary>
    class RNCookTriviaShowDeliciousFoodModule : NativeModuleBase
    {
        /// <summary>
        /// Instantiates the <see cref="RNCookTriviaShowDeliciousFoodModule"/>.
        /// </summary>
        internal RNCookTriviaShowDeliciousFoodModule()
        {

        }

        /// <summary>
        /// The name of the native module.
        /// </summary>
        public override string Name
        {
            get
            {
                return "RNCookTriviaShowDeliciousFood";
            }
        }
    }
}
