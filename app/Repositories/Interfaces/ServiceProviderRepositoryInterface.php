<?php

namespace App\Repositories\Interfaces;


interface ServiceProviderRepositoryInterface
{
    public function all();
    public function allActive();
    public function allActiveWithDetails();
    public function allWithDetails();
    public function paginate();
    public function create(array $data);
    public function show(int $id);
    public function getWhereAll(array $data);
    public function getWhereAllWithDetails(array $data);
    public function getWhereInIDs(array $ids);
    public function update(array $data, int $id);
    public function updateWithDetails(array $data, array $features,  int $id);
    public function filter($filter, $sort, $paginate);
    public function incrementRatingCount(int $id);
    public function getWithSchedules(int $id, array $status = ['inprogress', 'completed']);
    public function getWithActiveSchedules(int $id);
    public function getWithCompletedSchedules(int $id);
    public function getAllWhereCompound(int $compound_id, $service_provider_id = null);
    public function getAssignAllWhereCompound(int $compound_id);
    public function getReassignAllWhereCompound(int $compound_id, int $service_provider_id);

}
