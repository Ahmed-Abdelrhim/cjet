<?php

namespace App\Traits;

use Exception;
use Intervention\Image\Facades\Image;

trait UploadTrait
{

    private function createFolderIfNotExist($full_path)
    {
        if (!file_exists($full_path)) {
            mkdir($full_path, 0777, true);
        }
    }

    private function getFullPath(string $folder)
    {
        // $public_path = rtrim(app()->basePath('public/storage'), '/');
        $public_path = public_path('storage/');
        // dd($public_path . 'uploads/' . $folder);

        return $public_path . 'uploads/' . $folder;
    }

    private function getFileRandomName()
    {
        return time() . '_' . rand(111111, 999999);
    }

    public function upload($file, string $folder)
    {

        $full_path = $this->getFullPath($folder);

        $file_name = $this->getFileRandomName();

        $original_extension = $file->getClientOriginalExtension();

        $this->createFolderIfNotExist($full_path);

        if (in_array($original_extension, ['png', 'jpg', 'jpeg', 'webp'])) {
            Image::make($file)->encode('webp')->save($full_path . '/' . $file_name . '.webp');
            $file_name = $file_name . '.webp';
        } else {
            $file_name_with_original_extension = $file_name . '.' . $original_extension;
            $file->move($full_path, $file_name_with_original_extension);
            $file_name = $file_name_with_original_extension;
        }

        return 'uploads/' . $folder . '/' . $file_name;
    }

    public function uploadWithResize($image, string $folder, int $w, int $h)
    {

        $full_path = $this->getFullPath($folder);

        $file_name = $this->getFileRandomName();

        $original_extension = $image->getClientOriginalExtension();

        $this->createFolderIfNotExist($full_path);

        if (in_array($original_extension, ['png', 'jpg', 'jpeg', 'webp'])) {
            // Image::make($image)
            Image::make($image)
                ->encode('webp')
                ->orientate()
                ->resize($w, $h, function ($constraint) {
                    $constraint->aspectRatio();
                    $constraint->upsize();
                })
                ->save($full_path . '/' . $file_name . '.webp');

            $image_name = $file_name . '.webp';
        } else {
            $file_name_with_original_extension = $file_name . '.' . $original_extension;
            $image->move($full_path, $file_name_with_original_extension);
            $image_name = $file_name_with_original_extension;
        }

        return 'uploads/' . $folder . '/' . $image_name;
    }

    public function updateFile($file, string $folder, string $old_path)
    {
        $new_file_path = $this->upload($file, $folder);
        $this->deleteFile($old_path);
        return $new_file_path;
    }


    public function updateWithResize($file, string $folder, string $old_path, int $w, int $h)
    {
        $new_file_path = $this->uploadWithResize($file, $folder, $w, $h);
        $this->deleteFile($old_path);
        return $new_file_path;
    }


    public function deleteFile($file_path)
    {
        if ($file_path) {
            try {
                unlink(public_path('storage/') . $file_path);
            } catch (Exception $e) {
                return;
            }
        }
    }
}
