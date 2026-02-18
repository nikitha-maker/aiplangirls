import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'dart:math';


class FitnessGoalScreen extends StatefulWidget {
  const FitnessGoalScreen({super.key});

  @override
  State<FitnessGoalScreen> createState() => _FitnessGoalScreenState();


}

class _FitnessGoalScreenState extends State<FitnessGoalScreen> {
  int selectedIndex = 1;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF343434),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 12),

            // ===== HEADER =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Icon(Icons.arrow_back_ios, size: 18),
                    ],
                  ),
                  const SizedBox(height: 14),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.orange.shade400,
                              Colors.orange.shade800,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),

                      const SizedBox(width: 8),
                      Text(
                        "setme fit",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  // Progress Bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        width: index == 0 ? 26 : 18,
                        height: 4,
                        decoration: BoxDecoration(
                          gradient: index == 0
                              ? LinearGradient(
                            colors: [
                              Colors.orange.shade400,
                              Colors.orange.shade800,
                            ],
                          )
                              : null,
                          color: index == 0 ? null : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),

                      );
                    }),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // ===== TITLE =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ===== GRADIENT TITLE =====
                  ShaderMask(
                    shaderCallback: (bounds) {
                      return LinearGradient(
                        colors: [
                          Colors.orange.shade400,
                          Colors.orange.shade800,
                        ],
                      ).createShader(bounds);
                    },
                    child: Text(
                      "What’s your fitness goal?",
                      style: GoogleFonts.poppins(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: Colors.white, // required for ShaderMask
                      ),
                    ),
                  ),

                  const SizedBox(height: 6),

                  // ===== SUBTITLE (KEEP CLEAN) =====
                  Text(
                    "Your goal is our roadmap, let's make it happen!",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.85),
                    ),
                  ),
                ],
              ),
            ),


            const SizedBox(height: 36),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  // ===== TOP ROW (2 CARDS) =====
                  Row(
                    children: [
                      Expanded(
                        child: GoalCard(
                          title: "Weight Loss",
                          imagePath: "assets/weight_loss.png",
                          selected: selectedIndex == 0,
                          onTap: () {
                            setState(() => selectedIndex = 0);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const TargetWeightScreen(goal: GoalType.loss),
                              ),
                            );
                          },

                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: GoalCard(
                          title: "Muscle Build",
                          imagePath: "assets/muscle_build.png",
                          selected: selectedIndex == 1,
                          onTap: () {
                            setState(() => selectedIndex = 1);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const TargetWeightScreen(goal: GoalType.gain),
                              ),
                            );
                          },

                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // ===== BOTTOM CENTER CARD =====
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.55,
                    child: GoalCard(
                      title: "Keep Fit",
                      imagePath: "assets/keep_fit.png",
                      selected: selectedIndex == 2,
                      onTap: () {
                        setState(() => selectedIndex = 2);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const FocusAreaScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class GoalCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final bool selected;
  final VoidCallback onTap;

  const GoalCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 260,
        decoration: BoxDecoration(
          gradient: selected
              ? LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.orange.shade400,
              Colors.orange.shade800,
            ],
          )
              : null,
          color: selected ? null : Color(0xFFFAF3E1),
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: selected
                  ? Colors.orange.shade800.withOpacity(0.45)
                  : Colors.black.withOpacity(0.08),
              blurRadius: 16,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }
}
enum GoalType { loss, gain }
class TargetWeightScreen extends StatefulWidget {
  final GoalType goal;

  const TargetWeightScreen({
    super.key,
    required this.goal,
  });

  @override
  State<TargetWeightScreen> createState() => _TargetWeightScreenState();
}

class _TargetWeightScreenState extends State<TargetWeightScreen> {

  final Color orangeLight = Colors.orange.shade400;
  final Color orangeDark = Colors.orange.shade800;

  final double minWeight = 20;
  final double maxWeight = 120;
  final double tickWidth = 22;

  double currentWeight = 42;
  double targetWeight = 42;
  // temporary default height
  double heightCm = 170; // temporary height

  double get currentBmi {
    final h = heightCm / 100;
    return currentWeight / (h * h);
  }

  double get targetBmi {
    final h = heightCm / 100;
    return targetWeight / (h * h);
  }

  String bmiLabel(double bmi) {
    if (bmi < 18.5) return "Underweight";
    if (bmi < 25) return "Normal";
    if (bmi < 30) return "Overweight";
    return "Obese";
  }

  Color bmiColor(double bmi) {
    if (bmi < 18.5) return Colors.orange;
    if (bmi < 25) return Colors.green;
    if (bmi < 30) return Colors.redAccent;
    return Colors.red;
  }
  final ScrollController _currentController = ScrollController();
  final ScrollController _targetController = ScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _currentController.jumpTo((currentWeight - minWeight) * tickWidth);
      _targetController.jumpTo((targetWeight - minWeight) * tickWidth);
    });

    // CURRENT WEIGHT LISTENER
    _currentController.addListener(() {
      final index = (_currentController.offset / tickWidth).round();
      final value = minWeight + index;

      if (value >= minWeight && value <= maxWeight) {
        setState(() {
          currentWeight = value;

          // AUTO RESET TARGET WHEN CURRENT CHANGES
          targetWeight = value;
        });

        _targetController.jumpTo((targetWeight - minWeight) * tickWidth);
      }
    });

    // TARGET WEIGHT LISTENER (LOCK DIRECTION)
    _targetController.addListener(() {
      final index = (_targetController.offset / tickWidth).round();
      final value = minWeight + index;

      if (value >= minWeight && value <= maxWeight) {

        // Weight Loss → target cannot go ABOVE current
        if (widget.goal == GoalType.loss && value > currentWeight) return;

        // Muscle Gain → target cannot go BELOW current
        if (widget.goal == GoalType.gain && value < currentWeight) return;

        setState(() {
          targetWeight = value;
        });
      }
    });
  }

  // INSIGHT LOGIC
  double get weightDiff => targetWeight - currentWeight;
  bool get isWeightLoss => weightDiff < 0;
  bool get isWeightGain => weightDiff > 0;

  int get weeksEstimate {
    return (weightDiff.abs() / 0.75).ceil();
  }

  String get insightTitle {
    if (weightDiff == 0) return "Maintaining your weight";
    if (isWeightLoss) return "Healthy weight loss goal";
    return "Lean muscle gain goal";
  }

  String get insightMessage {
    if (weightDiff == 0) {
      return "Good! Staying at this weight helps improve fitness.";
    }

    if (isWeightLoss) {
      return "You are aiming to lose ${weightDiff.abs().round()} kg safely.";
    }

    return "You are aiming to gain ${weightDiff.round()} kg gradually.";
  }





  Widget buildScale(ScrollController controller, double selectedValue) {
    return SizedBox(
      height: 110,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ListView.builder(
            controller: controller,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: (maxWeight - minWeight + 1).toInt(),
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 2,
            ),
            itemBuilder: (context, index) {
              final value = minWeight + index;
              final isSelected = value.round() == selectedValue.round();

              return SizedBox(
                width: tickWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (value % 10 == 0)
                      Text(
                        value.toInt().toString(),
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color:
                          isSelected ? orangeLight : Colors.grey.shade400,
                        ),
                      ),
                    const SizedBox(height: 6),
                    Container(
                      height: value % 10 == 0 ? 34 : 18,
                      width: isSelected ? 3.5 : 2,
                      decoration: BoxDecoration(
                        gradient: isSelected
                            ? LinearGradient(
                          colors: [orangeLight, orangeDark],
                        )
                            : null,
                        color: isSelected ? null : Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          Positioned(
            bottom: 0,
            child: Container(
              height: 65,
              width: 4,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [orangeLight, orangeDark],
                ),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/target.png",
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.55),
            ),
          ),
          SafeArea(
            child: Column(
              children: [

                const SizedBox(height: 12),

                // HEADER
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back_ios, size: 18),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),

                      const SizedBox(height: 14),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [orangeLight, orangeDark],
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "SetMe FiT",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (i) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            width: i == 1 ? 26 : 18,
                            height: 4,
                            decoration: BoxDecoration(
                              gradient: i <= 1
                                  ? LinearGradient(
                                colors: [orangeLight, orangeDark],
                              )
                                  : null,
                              color:
                              i <= 1 ? null : Colors.grey.shade600,
                              borderRadius:
                              BorderRadius.circular(10),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                Text(
                  widget.goal == GoalType.loss
                      ? "Set your weight loss goal"
                      : "Set your muscle gain goal",
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: orangeLight,
                  ),
                ),

                const SizedBox(height: 11),

                Text(
                  "Current weight",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
                Text(
                  "${currentWeight.round()} kg",
                  style: GoogleFonts.poppins(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                buildScale(_currentController, currentWeight),

                const SizedBox(height: 15),

                Text(
                  "Target weight",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
                Text(
                  "${targetWeight.round()} kg",
                  style: GoogleFonts.poppins(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                buildScale(_targetController, targetWeight),

                const SizedBox(height: 20),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFAF3E1),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(insightTitle,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600)),
                      const SizedBox(height: 6),
                      Text(insightMessage),
                      const SizedBox(height: 1),

                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Current BMI",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),

                                Text(
                                  currentBmi.toStringAsFixed(1),
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: bmiColor(currentBmi),
                                  ),
                                ),
                                Text(
                                  bmiLabel(currentBmi),
                                  style: TextStyle(color: bmiColor(currentBmi)),
                                ),
                              ],
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Target BMI",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),

                                Text(
                                  targetBmi.toStringAsFixed(1),
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: bmiColor(targetBmi),
                                  ),
                                ),
                                Text(
                                  bmiLabel(targetBmi),
                                  style: TextStyle(color: bmiColor(targetBmi)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),


                    ],
                  ),
                ),

                const Spacer(),

                Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    height: 56,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        final diff =
                        (targetWeight - currentWeight).abs();
                        final weeks = (diff / 0.75).ceil();

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => WeightPredictionScreen(
                              currentWeight: currentWeight,
                              targetWeight: targetWeight,
                              weeks: weeks,
                            ),
                          ),
                        );
                      },
                      child: ShaderMask(
                        shaderCallback: (bounds) {
                          return LinearGradient(
                            colors: [orangeLight, orangeDark],
                          ).createShader(bounds);
                        },
                        child: const Text(
                          "CONTINUE",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

///---------2---------------


class FocusAreaScreen extends StatefulWidget {
  const FocusAreaScreen({super.key});

  @override
  State<FocusAreaScreen> createState() => _FocusAreaScreenState();
}

class _FocusAreaScreenState extends State<FocusAreaScreen> {
  final Color orangeLight = Colors.orange.shade400;
  final Color orangeDark = Colors.orange.shade800;
  final Color grey = Colors.grey.shade400;


  // ✅ DEFAULT SELECTED AREA (like premium app)

  Set<int> selectedFocusIndexes = {};




  final List<String> focusAreas = [
    "Arms",
    "Abs",
    "Butt",
    "Legs",
    "Full Body",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2F2F2F),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Icon(Icons.arrow_back_ios, size: 18),
                    ],
                  ),
                  const SizedBox(height: 14),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              orangeLight,
                              orangeDark,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),

                      ),
                      const SizedBox(width: 8),
                      Text(
                        "SetMe FiT",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  // Progress bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (i) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        width: i == 1 ? 26 : 18,
                        height: 4,
                        decoration: BoxDecoration(
                          gradient: i <= 1
                              ? LinearGradient(
                            colors: [orangeLight, orangeDark],
                          )
                              : null,
                          color: i <= 1 ? null : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),

                      );
                    }),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            // ===== TITLE =====
            ShaderMask(
              shaderCallback: (bounds) {
                return LinearGradient(
                  colors: [
                    Colors.orange.shade400,
                    Colors.orange.shade800,
                  ],
                ).createShader(bounds);
              },
              child: Text(
                "Which areas do you want to\nfocus on?",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.white, // IMPORTANT for ShaderMask
                ),
              ),
            ),




            const SizedBox(height: 6),
            Text(
              "Get a plan that best suits your focus area",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.grey.shade300,
              ),
            ),

            const SizedBox(height: 80),

            // ===== BODY + CONTROLS =====
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ================= LEFT: OPTIONS =================
                    Expanded(
                      flex: 6,
                      child: ListView.builder(
                        itemCount: focusAreas.length,
                        itemBuilder: (context, index) {
                          final bool selected = selectedFocusIndexes.contains(index);

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                if (index == 4) {
                                  // FULL BODY tapped
                                  if (selectedFocusIndexes.contains(0) &&
                                      selectedFocusIndexes.contains(1) &&
                                      selectedFocusIndexes.contains(2) &&
                                      selectedFocusIndexes.contains(3)) {
                                    selectedFocusIndexes.clear();
                                  } else {
                                    selectedFocusIndexes = {0, 1, 2, 3};
                                  }
                                } else {
                                  if (selectedFocusIndexes.contains(index)) {
                                    selectedFocusIndexes.remove(index);
                                  } else {
                                    selectedFocusIndexes.add(index);
                                  }
                                }
                              });
                            },
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: FractionallySizedBox(
                                widthFactor: 0.77,
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 16),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 28,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    gradient: selectedFocusIndexes.contains(index)
                                        ? LinearGradient(
                                      colors: [
                                        Colors.orange.shade400,
                                        Colors.orange.shade800,
                                      ],
                                    )
                                        : null,
                                    color: selectedFocusIndexes.contains(index)
                                        ? null
                                        : const Color(0xFFFAF3E1),
                                    borderRadius: BorderRadius.circular(28),
                                    boxShadow: [
                                      BoxShadow(
                                        color: selectedFocusIndexes.contains(index)
                                            ? Colors.orange.shade800.withOpacity(0.4)
                                            : Colors.black.withOpacity(0.08),
                                        blurRadius: 16,
                                        offset: const Offset(0, 6),
                                      ),
                                    ],
                                  ),

                                  child: Text(
                                    focusAreas[index],
                                    style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: selectedFocusIndexes.contains(index)
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );


                        },
                      ),
                    ),

                    const SizedBox(width: 16),

                    // ================= RIGHT: IMAGE =================
                    Expanded(
                      flex: 4,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Image.asset(
                            "assets/model1.png",
                            fit: BoxFit.contain,
                          ),

                          if (selectedFocusIndexes.contains(0))
                            Image.asset("assets/arms.png", fit: BoxFit.contain),

                          if (selectedFocusIndexes.contains(1))
                            Image.asset("assets/belly.png", fit: BoxFit.contain),

                          if (selectedFocusIndexes.contains(2))
                            Image.asset("assets/butt.png", fit: BoxFit.contain),

                          if (selectedFocusIndexes.contains(3))
                            Image.asset("assets/legs.png", fit: BoxFit.contain),
                        ],
                      ),

                    ),
                  ],
                ),
              ),
            ),



            // ===== CONTINUE BUTTON =====
            // ===== CONTINUE BUTTON =====
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                height: 56,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => TargetBodyTypeWidget(
                          selectedFocusIndexes: selectedFocusIndexes,
                        ),
                      ),
                    );
                  },

                  child: ShaderMask(
                    shaderCallback: (bounds) {
                      return LinearGradient(
                        colors: [
                          Colors.orange.shade400,
                          Colors.orange.shade800,
                        ],
                      ).createShader(bounds);
                    },
                    child: Text(
                      "CONTINUE",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

// ==========================================================
// 🔥 SINGLE SOURCE OF TRUTH FOR DOT + LINE + CARD
// ==========================================================
}
class TargetBodyTypeWidget extends StatefulWidget {
  final Set<int> selectedFocusIndexes;

  const TargetBodyTypeWidget({
    super.key,
    required this.selectedFocusIndexes,
  });


  @override
  State<TargetBodyTypeWidget> createState() => _TargetBodyTypeWidgetState();
}

class _TargetBodyTypeWidgetState extends State<TargetBodyTypeWidget> {
  double bodyFat = 30;

  String get bodyTypeTitle {
    switch (bodyIndex) {
      case 0:
        return "Athletic & Lean";
      case 1:
        return "Fit & Toned";
      case 2:
        return "Balanced Body";
      case 3:
        return "Fat Loss Focus";
      case 4:
        return "Long-Term Wellness";
      default:
        return "";
    }
  }

  String get bodyTypeDesc {
    switch (bodyIndex) {
      case 0:
        return "You already have very low body fat. Focus on muscle tone, strength, and performance.";
      case 1:
        return "A healthy and fit range. Maintain consistency and improve muscle definition.";
      case 2:
        return "A balanced body type. A mix of cardio and strength training works best here.";
      case 3:
        return "Focus on fat reduction with structured workouts and mindful nutrition.";
      case 4:
        return "Start slow, build daily habits, and focus on sustainable long-term health.";
      default:
        return "";
    }
  }

  int bodyIndex = 2; // default middle

  final List<String> bodyFatLabels = [
    "Body fat 10–13%",
    "Body fat 14–17%",
    "Body fat 18–22%",
    "Body fat 26–30%",
    "Body fat 30–35%",
  ];

  final List<String> bodyImages = [
    "assets/body_10_13.png",
    "assets/body_14_17.png",
    "assets/body_18_22.png",
    "assets/body_26_30.png",
    "assets/body_30_35.png",
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF343434),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 12),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      // ===== BACK ICON =====
                      Row(
                        children: const [
                          Icon(Icons.arrow_back_ios, size: 18, color: Colors.white),
                        ],
                      ),
                      const SizedBox(height: 8),

                      // ===== LOGO =====
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.orange.shade400,
                                  Colors.orange.shade800,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "SetMe FiT",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 14),

                      // ===== PROGRESS BAR (STEP 3) =====
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (i) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            width: i == 2 ? 26 : 18,
                            height: 4,
                            decoration: BoxDecoration(
                              gradient: i <= 2
                                  ? LinearGradient(
                                colors: [
                                  Colors.orange.shade400,
                                  Colors.orange.shade800,
                                ],
                              )
                                  : null,
                              color: i <= 2 ? null : Colors.grey.shade600,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),



                const SizedBox(height: 24),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ShaderMask(
                    shaderCallback: (bounds) {
                      return LinearGradient(
                        colors: [
                          Colors.orange.shade400,
                          Colors.orange.shade800,
                        ],
                      ).createShader(bounds);
                    },
                    child: Text(
                      "Choose your target body type",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 23,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),


                const SizedBox(height: 6),

        Text(
          "Select the body shape you want to achieve",
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.white70,
          ),
        ),

        const SizedBox(height: 28),

        // ===== IMAGE CARD =====
        Container(
          height: 240,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: const Color(0xFFFAF3E1),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: Colors.orange.withOpacity(0.6),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              bodyImages[bodyIndex],
              fit: BoxFit.contain,
            ),

          ),
        ),

        const SizedBox(height: 24),

        // ===== SLIDER =====
                Text(
                  bodyFatLabels[bodyIndex],
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey.shade300,
                  ),
                ),

                Slider(
                  value: bodyIndex.toDouble(),
                  min: 0,
                  max: 4,
                  divisions: 4, // 🔥 THIS IS THE KEY (5 steps)
                  activeColor: Colors.orange,
                  inactiveColor: Colors.grey.shade700,
                  onChanged: (value) {
                    setState(() {
                      bodyIndex = value.round();
                    });
                  },
                ),


                const SizedBox(height: 24),

        // ===== INSIGHT CARD =====
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF2A2A2A),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                bodyTypeTitle,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                bodyTypeDesc,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.grey.shade300,
                ),
              ),
            ],
          ),
        ),
                const SizedBox(height: 90),

                Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    height: 56,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        // ✅ for now just confirm selection
                        debugPrint("Selected body index: $bodyIndex");
                        debugPrint("Selected range: ${bodyFatLabels[bodyIndex]}");

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Selected: ${bodyFatLabels[bodyIndex]}",
                            ),
                          ),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => PlanSetupScreen(
                              selectedFocusAreas: widget.selectedFocusIndexes,
                              bodyIndex: bodyIndex,
                            ),
                          ),
                        );





                        // 🔜 later you can navigate to dashboard
                        // Navigator.push(context, MaterialPageRoute(builder: (_) => NextScreen()));
                      },
                      child: ShaderMask(
                        shaderCallback: (bounds) {
                          return LinearGradient(
                            colors: [
                              Colors.orange.shade400,
                              Colors.orange.shade800,
                            ],
                          ).createShader(bounds);
                        },
                        child: Text(
                          "CONTINUE",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

              ],

            ),),
        ),


    );
  }

}
//-------3---------
class ActivityLevelScreen extends StatefulWidget {
  const ActivityLevelScreen({super.key});

  @override
  State<ActivityLevelScreen> createState() => _ActivityLevelScreenState();
}

class _ActivityLevelScreenState extends State<ActivityLevelScreen> {
  int activityIndex = 1;

  final List<String> activityLevels = [
    "Beginner",
    "Lightly Active",
    "Moderately Active",
    "Very Active",
  ];

  final List<String> activityDesc = [
    "I rarely exercise or am just starting out",
    "I work out 1–2 days a week",
    "I work out 3–4 days a week",
    "I work out 5+ days a week",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF343434),
      body: Stack(
        children: [
      // 🔹 BACKGROUND IMAGE
      Positioned.fill(
      child: Image.asset(
        "assets/bg_activity.png",
        fit: BoxFit.cover,
      ),
    ),

    // 🔹 DARK OVERLAY (important for text readability)
    Positioned.fill(
    child: Container(
    color: Colors.black.withOpacity(0.55),
    ),
    ),

    // 🔹 YOUR EXISTING UI (unchanged)
    SafeArea(
    child: Column(
    children: [

    const SizedBox(height: 12),

            // ===== HEADER + PROGRESS =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Icon(Icons.arrow_back_ios,
                          size: 18, color: Colors.white),
                    ],
                  ),
                  const SizedBox(height: 14),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.orange.shade400,
                              Colors.orange.shade800,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "SetMe FiT",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  // Progress bar (STEP 4)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (i) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        width: i == 3 ? 26 : 18,
                        height: 4,
                        decoration: BoxDecoration(
                          gradient: i <= 3
                              ? LinearGradient(
                            colors: [
                              Colors.orange.shade400,
                              Colors.orange.shade800,
                            ],
                          )
                              : null,
                          color:
                          i <= 3 ? null : Colors.grey.shade600,
                          borderRadius:
                          BorderRadius.circular(10),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // ===== TITLE =====
            ShaderMask(
              shaderCallback: (bounds) {
                return LinearGradient(
                  colors: [
                    Colors.orange.shade400,
                    Colors.orange.shade800,
                  ],
                ).createShader(bounds);
              },
              child: Text(
                "How active are you?",
                style: GoogleFonts.poppins(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 6),

            Text(
              "This helps us personalize your workout intensity",
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),

            const SizedBox(height: 32),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                  itemCount: activityLevels.length,
                  itemBuilder: (context, index) {
                    final bool selected = activityIndex == index;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          activityIndex = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 18,
                        ),
                        decoration: BoxDecoration(
                          gradient: selected
                              ? LinearGradient(
                            colors: [
                              Colors.orange.shade400,
                              Colors.orange.shade800,
                            ],
                          )
                              : null,
                          color: selected ? null : const Color(0xFFFAF3E1),
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: selected
                                  ? Colors.orange.shade800.withOpacity(0.45)
                                  : Colors.black.withOpacity(0.08),
                              blurRadius: 16,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              activityLevels[index],
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: selected
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              activityDesc[index],
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),


            // ===== CONTINUE =====
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                height: 56,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => WorkoutPlaceScreen(
                          activityIndex: activityIndex,
                        ),

                      ),
                    );
                  },
                  child: ShaderMask(
                    shaderCallback: (bounds) {
                      return LinearGradient(
                        colors: [
                          Colors.orange.shade400,
                          Colors.orange.shade800,
                        ],
                      ).createShader(bounds);
                    },
                    child: Text(
                      "CONTINUE",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
    ],
    ),
    ),
        ],
      ),);

    }
}
//-------5--------
class WorkoutPlaceScreen extends StatefulWidget {
  final int activityIndex;

  const WorkoutPlaceScreen({
    super.key,
    required this.activityIndex,
  });


  @override
  State<WorkoutPlaceScreen> createState() => _WorkoutPlaceScreenState();
}

class _WorkoutPlaceScreenState extends State<WorkoutPlaceScreen> {
  int selectedPlace = -1;
// 0 = Home
// 1 = Gym
// 2 = Both

// 0 = Home, 1 = Gym
  // 0 = Home, 1 = Gym

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

      // ===== BACKGROUND IMAGE =====
      Positioned.fill(
      child: Image.asset(
        "assets/bg_workout_place.png",
        fit: BoxFit.cover,
      ),
    ),

    // ===== DARK OVERLAY =====
    Positioned.fill(
    child: Container(
    color: Colors.black.withOpacity(0.55),
    ),
    ),

    // ===== MAIN UI =====
    SafeArea(
    child: Column(
    children: [

    const SizedBox(height: 12),

            // ===== HEADER + PROGRESS (STEP 5) =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Icon(Icons.arrow_back_ios,
                          size: 18, color: Colors.white),
                    ],
                  ),
                  const SizedBox(height: 14),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.orange.shade400,
                              Colors.orange.shade800,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "SetMe FiT",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  // Progress bar (STEP 5)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (i) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        width: i == 4 ? 26 : 18,
                        height: 4,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.orange.shade400,
                              Colors.orange.shade800,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // ===== TITLE =====
            ShaderMask(
              shaderCallback: (bounds) {
                return LinearGradient(
                  colors: [
                    Colors.orange.shade400,
                    Colors.orange.shade800,
                  ],
                ).createShader(bounds);
              },
              child: Text(
                "Where do you work out?",
                style: GoogleFonts.poppins(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 8),

            Text(
              "Choose your primary workout place",
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),

            const SizedBox(height: 40),

            // ===== WOW OPTIONS =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _placeCard(
                          title: "Home",
                          icon: Icons.home_rounded,
                          isSelected: selectedPlace == 0 || selectedPlace == 2,
                          onTap: () {
                            setState(() {
                              selectedPlace = 0;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _placeCard(
                          title: "Gym",
                          icon: Icons.fitness_center_rounded,
                          isSelected: selectedPlace == 1 || selectedPlace == 2,
                          onTap: () {
                            setState(() {
                              selectedPlace = 1;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.42, // 👈 SAME SIZE FEEL
                      child: _placeCard(
                        title: "Both",
                        icon: Icons.all_inclusive_rounded,
                        isSelected: selectedPlace == 2,
                        onTap: () {
                          setState(() {
                            selectedPlace = 2; // auto selects Home + Gym
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),

            ),

            const Spacer(),

            // ===== CONTINUE =====
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                height: 56,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => InjuryScreen(
                          activityIndex: widget.activityIndex,
                          workoutPlace: selectedPlace,
                        ),
                      ),
                    );
                  },


                  child: ShaderMask(
                    shaderCallback: (bounds) {
                      return LinearGradient(
                        colors: [
                          Colors.orange.shade400,
                          Colors.orange.shade800,
                        ],
                      ).createShader(bounds);
                    },
                    child: Text(
                      "CONTINUE",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
    ],
    ),
    ),
        ],
      ),
    );
  }
  }

  // ===== WOW CARD =====
  Widget _placeCard({
    required String title,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedScale(
        scale: isSelected ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: Container(
          height: 180,
          decoration: BoxDecoration(
            gradient: isSelected
                ? LinearGradient(
              colors: [
                Colors.orange.shade400,
                Colors.orange.shade800,
              ],
            )
                : null,
            color: isSelected ? null : const Color(0xFFFAF3E1),
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: isSelected
                    ? Colors.orange.shade800.withOpacity(0.45)
                    : Colors.black.withOpacity(0.08),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 48,
                color: isSelected ? Colors.white : Colors.black,
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//------6-----
class InjuryScreen extends StatefulWidget {
  final int activityIndex;
  final int workoutPlace;

  const InjuryScreen({
    super.key,
    required this.activityIndex,
    required this.workoutPlace,
  });


  @override
  State<InjuryScreen> createState() => _InjuryScreenState();
}

class _InjuryScreenState extends State<InjuryScreen> {
  Set<int> selectedInjuries = {};

  final List<Map<String, String>> injuries = [
    {"title": "No Injuries", "image": "assets/injury_none.png"},
    {"title": "Shoulder", "image": "assets/injury_shoulder.png"},
    {"title": "Back", "image": "assets/injury_back.png"},
    {"title": "Waist", "image": "assets/injury_waist.png"},
    {"title": "Wrist", "image": "assets/injury_wrist.png"},
    {"title": "Knee", "image": "assets/injury_knee.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF343434),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 12),

            // ===== HEADER + PROGRESS (STEP 6) =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Icon(Icons.arrow_back_ios,
                          size: 18, color: Colors.white),
                    ],
                  ),
                  const SizedBox(height: 3),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.orange.shade400,
                              Colors.orange.shade800,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "SetMe FiT",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(6, (i) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        width: i == 5 ? 26 : 18,
                        height: 4,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.orange.shade400,
                              Colors.orange.shade800,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ===== TITLE =====
            ShaderMask(
              shaderCallback: (bounds) {
                return LinearGradient(
                  colors: [
                    Colors.orange.shade400,
                    Colors.orange.shade800,
                  ],
                ).createShader(bounds);
              },
              child: Text(
                "Have you suffered any injuries recently?",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 23,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 8),

            Text(
              "Select all that apply",
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),

            const SizedBox(height: 32),

            // ===== 3x2 GRID =====
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: GridView.builder(
                  itemCount: injuries.length,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1.1,
                  ),
                  itemBuilder: (context, index) {
                    final bool selected =
                    selectedInjuries.contains(index);

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (index == 0) {
                            // No Injuries
                            selectedInjuries = {0};
                          } else {
                            selectedInjuries.remove(0);
                            if (selected) {
                              selectedInjuries.remove(index);
                            } else {
                              selectedInjuries.add(index);
                            }
                          }
                        });
                      },
                      child: AnimatedScale(
                        scale: selected ? 1.05 : 1.0,
                        duration: const Duration(milliseconds: 200),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: selected
                                ? LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.orange.shade400,
                                Colors.orange.shade800,
                              ],
                            )
                                : null,
                            color: selected ? null : const Color(0xFFFAF3E1),
                            borderRadius: BorderRadius.circular(26),
                            boxShadow: [
                              BoxShadow(
                                color: selected
                                    ? Colors.orange.shade800.withOpacity(0.45)
                                    : Colors.black.withOpacity(0.08),
                                blurRadius: 18,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),

                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(26),
                              clipBehavior: Clip.none, // 🔥 VERY IMPORTANT
                              child: Stack(
                                clipBehavior: Clip.none, // 🔥 allows overflow
                                children: [
                                  // ===== TITLE (TOP-LEFT) =====
                                  Positioned(
                                    top: -10,
                                    left: 1,
                                    right: 18,
                                    child: Text(
                                      injuries[index]["title"]!,
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: selected ? Colors.white : Colors.black,
                                      ),
                                    ),
                                  ),

                                  // ===== IMAGE (BOTTOM-RIGHT, TOUCHING CARD EDGE) =====
                                  Positioned(
                                    bottom: -19,   // 👈 touches bottom edge
                                    right: -6,    // 👈 slight overflow to right
                                    child: SizedBox(
                                      height: 140, // 👈 BIG like premium app
                                      child: Image.asset(
                                        injuries[index]["image"]!,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),


                          ),



                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // ===== CONTINUE =====
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                height: 56,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PlanFinalizationScreen(
                          activityIndex: widget.activityIndex,
                          workoutPlace: widget.workoutPlace,
                          injuries: selectedInjuries,
                        ),
                      ),
                    );
                  },


                  child: ShaderMask(
                    shaderCallback: (bounds) {
                      return LinearGradient(
                        colors: [
                          Colors.orange.shade400,
                          Colors.orange.shade800,
                        ],
                      ).createShader(bounds);
                    },
                    child: Text(
                      "CONTINUE",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class WeightPredictionScreen extends StatefulWidget {
  final double currentWeight;
  final double targetWeight;
  final int weeks;

  const WeightPredictionScreen({
    super.key,
    required this.currentWeight,
    required this.targetWeight,
    required this.weeks,
  });

  @override
  State<WeightPredictionScreen> createState() =>
      _WeightPredictionScreenState();
}

class _WeightPredictionScreenState extends State<WeightPredictionScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String get targetDateText {
    final date = DateTime.now().add(
      Duration(days: widget.weeks * 7),
    );
    return "${_month(date.month)} ${date.day}";
  }

  String _month(int m) {
    const months = [
      "Jan","Feb","Mar","Apr","May","Jun",
      "Jul","Aug","Sep","Oct","Nov","Dec"
    ];
    return months[m - 1];
  }
  double get heightCm => 170; // temporary default height

  double get currentBmi {
    final h = heightCm / 100;
    return widget.currentWeight / (h * h);
  }

  double get targetBmi {
    final h = heightCm / 100;
    return widget.targetWeight / (h * h);
  }

  String bmiLabel(double bmi) {
    if (bmi < 18.5) return "Underweight";
    if (bmi < 25) return "Normal";
    if (bmi < 30) return "Overweight";
    return "Obese";
  }


  @override
  Widget build(BuildContext context) {
    final orangeLight = Colors.orange.shade400;
    final orangeDark = Colors.orange.shade800;

    return Scaffold(
      backgroundColor: const Color(0xFF343434),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 12),

            // ===== HEADER (SAME STYLE) =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Icon(Icons.arrow_back_ios,
                          size: 18, color: Colors.white),
                    ],
                  ),
                  const SizedBox(height: 14),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [orangeLight, orangeDark],
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "SetMe FiT",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  // Progress bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (i) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        width: i == 2 ? 26 : 18,
                        height: 4,
                        decoration: BoxDecoration(
                          gradient: i <= 2
                              ? LinearGradient(
                            colors: [orangeLight, orangeDark],
                          )
                              : null,
                          color:
                          i <= 2 ? null : Colors.grey.shade600,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Text(
              "We predict that you'll be",
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),

            const SizedBox(height: 6),

            RichText(
              text: TextSpan(
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
                children: [
                  TextSpan(
                    text: "${widget.targetWeight.round()}kg ",
                    style: TextStyle(color: orangeLight),
                  ),
                  TextSpan(
                    text: "on $targetDateText",
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // ===== ANIMATED GRAPH (FIXED) =====
            LayoutBuilder(
              builder: (context, constraints) {
                return SizedBox(
                  height: 200, // graph height (same as before feel)
                  width: constraints.maxWidth, // FULL WIDTH
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, _) {
                      return CustomPaint(
                        size: Size(constraints.maxWidth, 200), // 🔥 CRITICAL
                        painter: AnimatedWeightCurvePainter(
                          progress: _controller.value,
                          lightColor: orangeLight,
                          darkColor: orangeDark,
                          targetDateText: targetDateText,
                        ),
                      );
                    },
                  ),
                );
              },
            ),



            const SizedBox(height: 30),

            Text(
              "Excellent!",
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              "We’ve got a clear understanding of you and your body",
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 24),

// ===== BMI CARD =====


            const Spacer(),

            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                height: 56,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const FocusAreaScreen(),
                      ),
                    );
                  },

                  child: ShaderMask(
                    shaderCallback: (bounds) {
                      return LinearGradient(
                        colors: [orangeLight, orangeDark],
                      ).createShader(bounds);
                    },
                    child: Text(
                      "CONTINUE",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
Widget _bmiValue({
  required String title,
  required double value,
  required Color color,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 13,
          color: Colors.white70,
        ),
      ),
      const SizedBox(height: 4),
      Text(
        value.toStringAsFixed(1),
        style: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: color,
        ),
      ),
    ],
  );
}

class AnimatedWeightCurvePainter extends CustomPainter {
  final double progress;
  final Color lightColor;
  final Color darkColor;
  final String targetDateText;

  AnimatedWeightCurvePainter({
    required this.progress,
    required this.lightColor,
    required this.darkColor,
    required this.targetDateText,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final startX = 0.0;
    final endX = size.width;

    final startY = size.height * 0.75;
    final endY = size.height * 0.35;

    // ===== CURVE =====
    final path = Path();
    path.moveTo(startX, startY);
    path.cubicTo(
      size.width * 0.3,
      startY,
      size.width * 0.6,
      endY,
      endX,
      endY,
    );

    final metric = path.computeMetrics().first;
    final drawPath =
    metric.extractPath(0, metric.length * progress);

    // ===== LINE =====
    final linePaint = Paint()
      ..shader = LinearGradient(
        colors: [lightColor, darkColor],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ).createShader(
        Rect.fromLTWH(0, 0, size.width, size.height),
      )
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawPath(drawPath, linePaint);

    // ===== FILL =====
    final fillPath = Path.from(drawPath)
      ..lineTo(endX, size.height)
      ..lineTo(startX, size.height)
      ..close();

    final fillPaint = Paint()
      ..shader = LinearGradient(
        colors: [
          lightColor.withOpacity(0.25),
          darkColor.withOpacity(0.05),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(
        Rect.fromLTWH(0, 0, size.width, size.height),
      );

    canvas.drawPath(fillPath, fillPaint);

    // ===== START DOT =====
    final startDotPaint = Paint()..color = lightColor;
    canvas.drawCircle(
      Offset(startX, startY),
      5,
      startDotPaint,
    );

    // ===== TODAY TEXT =====
    _drawText(
      canvas,
      "Today",
      Offset(startX + 2, startY + 14),
      lightColor,
    );

    // ===== END POINT =====
    if (progress > 0.95) {
      final endPoint =
          metric.getTangentForOffset(metric.length)!.position;

      // Dotted vertical line
      final dashPaint = Paint()
        ..color = darkColor.withOpacity(0.6)
        ..strokeWidth = 1;

      double y = endPoint.dy + 8;
      while (y < size.height) {
        canvas.drawLine(
          Offset(endPoint.dx, y),
          Offset(endPoint.dx, y + 6),
          dashPaint,
        );
        y += 12;
      }

      // Trophy
      final trophyPainter = TextPainter(
        text: const TextSpan(
          text: "🏆",
          style: TextStyle(fontSize: 26),
        ),
        textDirection: TextDirection.ltr,
      )..layout();

      trophyPainter.paint(
        canvas,
        endPoint.translate(-12, -36),
      );

      // Target date text
      _drawText(
        canvas,
        targetDateText,
        Offset(endPoint.dx - 20, endPoint.dy + 14),
        darkColor,
      );
    }
  }

  void _drawText(
      Canvas canvas,
      String text,
      Offset position,
      Color color,
      ) {
    final painter = TextPainter(
      text: TextSpan(
        text: text,
        style: GoogleFonts.poppins(
          fontSize: 12,
          color: color,
          fontWeight: FontWeight.w500,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    painter.paint(canvas, position);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
class BodyTransformationGraphScreen extends StatelessWidget {
  final Set<int> selectedFocusAreas;
  final int bodyIndex;

  const BodyTransformationGraphScreen({
    super.key,
    required this.selectedFocusAreas,
    required this.bodyIndex,
  });

  String get focusText {
    if (selectedFocusAreas.isEmpty) return "your body";

    final areas = <String>[];
    if (selectedFocusAreas.contains(0)) areas.add("arms");
    if (selectedFocusAreas.contains(1)) areas.add("abs");
    if (selectedFocusAreas.contains(2)) areas.add("glutes");
    if (selectedFocusAreas.contains(3)) areas.add("legs");

    return areas.join(" & ");
  }

  String get bodyGoalText {
    switch (bodyIndex) {
      case 0:
        return "lean and athletic";
      case 1:
        return "fit and toned";
      case 2:
        return "balanced and healthy";
      case 3:
        return "fat loss focused";
      default:
        return "healthier";
    }
  }

  @override
  Widget build(BuildContext context) {
    final orangeLight = Colors.orange.shade400;
    final orangeDark = Colors.orange.shade800;

    return Scaffold(
      backgroundColor: const Color(0xFF343434),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 24),

            Text(
              "Your transformation journey",
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Based on your focus on $focusText and a $bodyGoalText body goal",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
            ),

            const SizedBox(height: 40),

            // Reuse SAME GRAPH STYLE (no logic change)
            Expanded(
              child: SizedBox.expand(
                child: CustomPaint(
                  painter: AnimatedWeightCurvePainter(
                    progress: 1.0, // static full curve
                    lightColor: orangeLight,
                    darkColor: orangeDark,
                    targetDateText: "Future",
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              "Excellent!",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),

            const Spacer(),

            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                height: 56,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ActivityLevelScreen(),
                      ),
                    );
                  },
                  child: ShaderMask(
                    shaderCallback: (bounds) {
                      return LinearGradient(
                        colors: [orangeLight, orangeDark],
                      ).createShader(bounds);
                    },
                    child: Text(
                      "CONTINUE",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class PlanSetupScreen extends StatefulWidget {
  final Set<int> selectedFocusAreas;
  final int bodyIndex;

  const PlanSetupScreen({
    super.key,
    required this.selectedFocusAreas,
    required this.bodyIndex,
  });

  @override
  State<PlanSetupScreen> createState() => _PlanSetupScreenState();
}

class _PlanSetupScreenState extends State<PlanSetupScreen>
    with SingleTickerProviderStateMixin {
  int currentStep = 0;
  late AnimationController _cardController;

  late Animation<Offset> card1Slide;
  late Animation<Offset> card2Slide;
  late Animation<Offset> card3Slide;

  late Animation<double> glow1;
  late Animation<double> glow2;
  late Animation<double> glow3;


  @override
  void initState() {

    super.initState();
    _cardController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    )..forward();

    card1Slide = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _cardController,
      curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
    ));

    card2Slide = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _cardController,
      curve: const Interval(0.3, 0.7, curve: Curves.easeOut),
    ));

    card3Slide = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _cardController,
      curve: const Interval(0.6, 1.0, curve: Curves.easeOut),
    ));

    glow1 = Tween<double>(begin: 0, end: 18).animate(
      CurvedAnimation(parent: _cardController, curve: const Interval(0.0, 0.4)),
    );

    glow2 = Tween<double>(begin: 0, end: 18).animate(
      CurvedAnimation(parent: _cardController, curve: const Interval(0.3, 0.7)),
    );

    glow3 = Tween<double>(begin: 0, end: 18).animate(
      CurvedAnimation(parent: _cardController, curve: const Interval(0.6, 1.0)),
    );




    // Animate steps one by one
    Future.delayed(const Duration(milliseconds: 400), () {
      if (mounted) setState(() => currentStep = 1);
    });
    Future.delayed(const Duration(milliseconds: 900), () {
      if (mounted) setState(() => currentStep = 2);
    });
    Future.delayed(const Duration(milliseconds: 1400), () {
      if (mounted) setState(() => currentStep = 3);
    });
    Future.delayed(const Duration(milliseconds: 1900), () {
      if (mounted) setState(() => currentStep = 4);
    });
  }
  @override
  void dispose() {
    _cardController.dispose();
    super.dispose();
  }

  String get focusText {
    if (widget.selectedFocusAreas.contains(4)) return "Full Body";

    final hasUpper =
        widget.selectedFocusAreas.contains(0) ||
            widget.selectedFocusAreas.contains(1);
    final hasLower =
        widget.selectedFocusAreas.contains(2) ||
            widget.selectedFocusAreas.contains(3);

    if (hasUpper && hasLower) return "Full Body";
    if (hasUpper) return "Upper Body";
    if (hasLower) return "Lower Body";

    return "Full Body";
  }

  String get bodyGoal {
    switch (widget.bodyIndex) {
      case 0:
        return "Athletic & Lean";
      case 1:
        return "Fit & Toned";
      case 2:
        return "Balanced Body";
      case 3:
        return "Fat Loss Focus";
      default:
        return "Balanced Body";
    }
  }
  Widget buildAnimatedCard({
    required Animation<Offset> slide,
    required Animation<double> glow,
    required IconData icon,
    required String text,
  }) {
    final orangeLight = Colors.orange.shade400;
    final orangeDark = Colors.orange.shade800;

    return SlideTransition(
      position: slide,
      child: AnimatedBuilder(
        animation: glow,
        builder: (_, __) {
          return Container(
            margin: const EdgeInsets.only(bottom: 18),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [orangeLight.withOpacity(0.12), Colors.black],
              ),
              boxShadow: [
                BoxShadow(
                  color: orangeLight.withOpacity(0.6),
                  blurRadius: glow.value,
                  spreadRadius: glow.value / 2,
                )
              ],
            ),
            child: Row(
              children: [
                Icon(icon, color: orangeLight, size: 26),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    text,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }


  Widget buildStep({
    required int step,
    required String text,
  }) {
    final orange = Colors.orange.shade400;

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 400),
      opacity: currentStep >= step ? 1 : 0,
      child: AnimatedSlide(
        duration: const Duration(milliseconds: 400),
        offset: currentStep >= step ? Offset.zero : const Offset(0, 0.2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              currentStep > step ? "✅" : "⏳",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: Colors.white.withOpacity(0.9),
                  fontWeight:
                  currentStep == step ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final orangeLight = Colors.orange.shade400;
    final orangeDark = Colors.orange.shade800;

    return Scaffold(
      backgroundColor: const Color(0xFF343434),
      body: SafeArea(
        child: Stack(
          children: [

            // 🔥 BACKGROUND ANIMATION
            Positioned.fill(
              child: Opacity(
                opacity: 0.35,
                child: Lottie.asset(
                  "assets/fitness_glow.json",
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // 🔥 YOUR EXISTING UI
            Column(

              children: [
                const SizedBox(height: 12),

                // ===== HEADER (SAME STYLE AS YOUR APP) =====
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back_ios, size: 18),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),

                      const SizedBox(height: 14),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [orangeLight, orangeDark],
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "SetMe FiT",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 14),

                      // Progress bar
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (i) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            width: i == 3 ? 26 : 18,
                            height: 4,
                            decoration: BoxDecoration(
                              gradient: i <= 3
                                  ? LinearGradient(
                                colors: [orangeLight, orangeDark],
                              )
                                  : null,
                              color:
                              i <= 3 ? null : Colors.grey.shade600,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                // ===== TITLE =====
                Text(
                  "Setting up your fitness plan",
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 30),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [

                      buildAnimatedCard(
                        slide: card1Slide,
                        glow: glow1,
                        icon: Icons.psychology,
                        text: "Identifying your body type",
                      ),

                      buildAnimatedCard(
                        slide: card2Slide,
                        glow: glow2,
                        icon: Icons.flag,
                        text: "Connecting to your goals",
                      ),

                      buildAnimatedCard(
                        slide: card3Slide,
                        glow: glow3,
                        icon: Icons.auto_awesome,
                        text: "Tailoring a personalized plan",
                      ),
                    ],
                  ),
                ),


                const SizedBox(height: 30),

                if (currentStep >= 4)
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 400),
                    opacity: 1,
                    child: Text(
                      "",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: orangeLight,
                      ),
                    ),
                  ),

                const Spacer(),

                // ===== CONTINUE BUTTON =====
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    height: 56,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: currentStep >= 4
                          ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                            const ActivityLevelScreen(),
                          ),
                        );
                      }
                          : null,
                      child: ShaderMask(
                        shaderCallback: (bounds) {
                          return LinearGradient(
                            colors: [orangeLight, orangeDark],
                          ).createShader(bounds);
                        },
                        child: Text(
                          "CONTINUE",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],),
          ],
        ),
      ),
    );
  }
}

class PlanFinalizationScreen extends StatefulWidget {
  final int activityIndex;
  final int workoutPlace;
  final Set<int> injuries;

  const PlanFinalizationScreen({
    super.key,
    required this.activityIndex,
    required this.workoutPlace,
    required this.injuries,
  });

  @override
  State<PlanFinalizationScreen> createState() =>
      _PlanFinalizationScreenState();
}

class _PlanFinalizationScreenState extends State<PlanFinalizationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int currentStep = 0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    )..forward();

    Future.delayed(const Duration(milliseconds: 700), () {
      if (mounted) setState(() => currentStep = 1);
    });
    Future.delayed(const Duration(milliseconds: 1400), () {
      if (mounted) setState(() => currentStep = 2);
    });
    Future.delayed(const Duration(milliseconds: 2100), () {
      if (mounted) setState(() => currentStep = 3);
    });
  }
  String get intensityInsight {
    switch (widget.activityIndex) {
      case 0:
        return "⚡ Training intensity set to Low\nGentle workouts to help you build consistency.";
      case 1:
        return "⚡ Training intensity set to Moderate\nBalanced workouts tailored to your routine.";
      case 2:
        return "⚡ Training intensity set to Active\nChallenging sessions to boost strength and stamina.";
      case 3:
        return "⚡ Training intensity set to High\nHigh-energy workouts for maximum performance.";
      default:
        return "⚡ Training intensity optimized for you.";
    }
  }
  String get environmentInsight {
    switch (widget.workoutPlace) {
      case 0:
        return "🏠 Workout environment optimized for Home\nBodyweight and space-friendly workouts included.";
      case 1:
        return "🏋️ Workout environment optimized for Gym\nEquipment-based workouts unlocked.";
      case 2:
        return "🏠🏋️ Flexible workout environment\nTrain seamlessly at home or in the gym.";
      default:
        return "🏠 Workout environment optimized for you.";
    }
  }
  String get safetyInsight {
    if (widget.injuries.isEmpty || widget.injuries.contains(0)) {
      return "🛡️ No injury restrictions\nFull exercise range enabled for faster progress.";
    }

    if (widget.injuries.length == 1) {
      return "🛡️ Safety adjustments applied\nExercises modified to protect selected areas.";
    }

    return "🛡️ Advanced safety adjustments applied\nYour plan avoids strain on sensitive areas.";
  }


  String get intensityText {
    switch (widget.activityIndex) {
      case 0:
        return "Low";
      case 1:
        return "Moderate";
      case 2:
        return "Active";
      case 3:
        return "High";
      default:
        return "Moderate";
    }
  }

  String get environmentText {
    if (widget.workoutPlace == 0) return "Home";
    if (widget.workoutPlace == 1) return "Gym";
    return "Home & Gym";
  }

  String get safetyText {
    if (widget.injuries.isEmpty || widget.injuries.contains(0)) {
      return "No injury restrictions";
    }
    return "Safety adjustments applied";
  }

  Widget buildStep(String text, int step) {
    return AnimatedOpacity(
      opacity: currentStep >= step ? 1 : 0,
      duration: const Duration(milliseconds: 400),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            Text(
              currentStep > step ? "✅" : "⏳",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: GoogleFonts.poppins(
                  color: Colors.white70,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final orangeLight = Colors.orange.shade400;
    final orangeDark = Colors.orange.shade800;

    return Scaffold(
      backgroundColor: const Color(0xFF343434),
      body: SafeArea(
        child: Stack(
          children: [

            // ================= MAIN CONTENT =================
            Positioned.fill(
              child: Column(
                children: [
                  const SizedBox(height: 12),

                  // ===== HEADER =====
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.arrow_back_ios,
                                size: 18, color: Colors.white),
                          ],
                        ),
                        const SizedBox(height: 14),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [orangeLight, orangeDark],
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "SetMe FiT",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),

                        // Progress bar
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(5, (i) {
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 6),
                              width: i == 4 ? 26 : 18,
                              height: 4,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [orangeLight, orangeDark],
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  Text(
                    "Finalizing your training plan",
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // ===== CIRCULAR VISUAL =====
                  SizedBox(
                    height: 180,
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (_, __) {
                        return CustomPaint(
                          painter: _RingPainter(_controller.value),
                          child: const SizedBox.expand(),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 30),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Column(
                      children: [
                        buildStep(intensityInsight, 1),
                        buildStep(environmentInsight, 2),
                        buildStep(safetyInsight, 3),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ✅ TEXT ONLY (NO POPUPS HERE)
                  if (currentStep >= 3)
                    Text(
                      "🎉 You’re all set!",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.orange.shade400,
                      ),
                    ),

                  const Spacer(),

                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      height: 56,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        onPressed: currentStep >= 3 ? () {} : null,
                        child: ShaderMask(
                          shaderCallback: (bounds) {
                            return LinearGradient(
                              colors: [orangeLight, orangeDark],
                            ).createShader(bounds);
                          },
                          child: Text(
                            "CONTINUE",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ================= POPUP OVERLAY =================
            if (currentStep == 3)
              const CelebrationPopups(),
          ],
        ),
      ),
    );

  }
}
class _RingPainter extends CustomPainter {
  final double progress;

  _RingPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = 68.0;
    final stroke = 14.0;

    final baseAngle = -1.57; // top
    final gap = 0.22;

    final segments = [
      _RingSegment(
        color: Colors.greenAccent,
        icon: "⚡",
        label: "Intensity",
        start: baseAngle,
      ),
      _RingSegment(
        color: Colors.orangeAccent,
        icon: "🏠",
        label: "Environment",
        start: baseAngle + 1.8 + gap,
      ),
      _RingSegment(
        color: Colors.lightBlueAccent,
        icon: "🛡️",
        label: "Safety",
        start: baseAngle + 3.6 + gap * 2,
      ),
    ];

    for (int i = 0; i < segments.length; i++) {
      final isVisible = progress >= (i + 1) / segments.length;
      if (!isVisible) continue;

      final paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = stroke
        ..strokeCap = StrokeCap.round
        ..shader = LinearGradient(
          colors: [
            segments[i].color.withOpacity(0.6),
            segments[i].color,
          ],
        ).createShader(
          Rect.fromCircle(center: center, radius: radius),
        );

      // Glow
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        segments[i].start,
        1.4,
        false,
        paint..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8),
      );

      // Main arc
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        segments[i].start,
        1.4,
        false,
        paint..maskFilter = null,
      );

      // Label
      _drawLabel(
        canvas,
        center,
        radius + 26,
        segments[i],
      );
    }

    // Center check
    if (progress > 0.95) {
      final tp = TextPainter(
        text: const TextSpan(
          text: "✔",
          style: TextStyle(
            fontSize: 42,
            color: Colors.orangeAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();

      tp.paint(
        canvas,
        Offset(
          center.dx - tp.width / 2,
          center.dy - tp.height / 2,
        ),
      );
    }
  }

  void _drawLabel(
      Canvas canvas,
      Offset center,
      double distance,
      _RingSegment segment,
      ) {
    final angle = segment.start + 0.7;
    final position = Offset(
      center.dx + distance * cos(angle),
      center.dy + distance * sin(angle),
    );

    final painter = TextPainter(
      text: TextSpan(
        text: "${segment.icon} ${segment.label}",
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.white70,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    painter.paint(
      canvas,
      position.translate(-painter.width / 2, -painter.height / 2),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _RingSegment {
  final Color color;
  final String icon;
  final String label;
  final double start;

  _RingSegment({
    required this.color,
    required this.icon,
    required this.label,
    required this.start,
  });
}
class CelebrationPopups extends StatefulWidget {
  const CelebrationPopups({super.key});

  @override
  State<CelebrationPopups> createState() => _CelebrationPopupsState();
}

class _CelebrationPopupsState extends State<CelebrationPopups>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late double centerX; // ✅ stored safely

  final emojis = ["🎉", "💪", "🔥", "🏆"];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    )..forward();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // ✅ SAFE place to read MediaQuery
    centerX = MediaQuery.of(context).size.width / 2;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          return Stack(
            children: List.generate(emojis.length, (i) {
              final progress = _controller.value;
              final offsetX = (i - 1.5) * 40;
              final offsetY = -progress * 120;

              return Positioned(
                left: centerX + offsetX,
                bottom: 160 + offsetY,
                child: Opacity(
                  opacity: 1 - progress,
                  child: Transform.scale(
                    scale: 0.6 + progress,
                    child: Text(
                      emojis[i],
                      style: const TextStyle(fontSize: 28),
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
