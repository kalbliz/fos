# Flutter Wrapper
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.** { *; }

# Firebase
-keep class com.google.firebase.** { *; }
-keep class com.firebase.** { *; }
-keep class com.google.android.gms.** { *; }
-keep class com.google.firebase.auth.internal.RecaptchaActivity { *; }
-keepattributes Signature

# If using Firebase Firestore
-keep class com.google.firestore.** { *; }
-keep class com.google.firebase.firestore.** { *; }

# If using Firebase Realtime Database
-keep class com.google.firebase.database.** { *; }

# If using Firebase Storage
-keep class com.google.firebase.storage.** { *; }

# If using Firebase Cloud Messaging (FCM)
-keep class com.google.firebase.messaging.** { *; }
-keep class com.google.android.gms.measurement.AppMeasurement { *; }
-keep class com.google.android.gms.measurement.AppMeasurement$* { *; }
-keep class com.google.firebase.analytics.FirebaseAnalytics { *; }

# If using Firebase Performance Monitoring
-keep class com.google.firebase.perf.** { *; }
-keepnames class com.google.firebase.perf.** { *; }
-keepclassmembers class com.google.firebase.perf.** { *; }

# If using Firebase Crashlytics
-keep class com.google.firebase.crashlytics.** { *; }

# Other Firebase dependencies
-keep class com.google.android.gms.common.api.** { *; }
-keep class com.google.android.gms.common.internal.** { *; }
-keep class com.google.android.gms.tasks.** { *; }

# Glide Image Loading Library (if used)
-keep public class * implements com.bumptech.glide.module.GlideModule
-keep public enum com.bumptech.glide.load.resource.bitmap.ImageHeaderParser$** {
  **[] $VALUES;
  public *;
}

# Keep support library libraries (if used)
-keep class android.support.v8.renderscript.** { *; }
-keep interface android.support.v8.renderscript.** { *; }
-keep class android.support.v7.widget.** { *; }

# Keep any custom models or serializers (replace com.example.yourapp with your app's package name)
-keep class com.tobias.fos.models.** { *; }
-keep class com.example.yourapp.serializers.** { *; }
